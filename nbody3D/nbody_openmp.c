//
#include <omp.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>
#include <stdbool.h>
#include <string.h>
//
typedef float              f32;
typedef double             f64;
typedef unsigned long      u32;
//typedef unsigned long long u64;
//

typedef struct particle_array {

  f32 *tx, *ty, *tz;
  f32 *tvx, *tvy, *tvz;

} particle_a;

//
void init(particle_a *pa, u32 n)
{
  for (u32 i = 0; i < n; i++)
    {
      //
      u32 r1 = (u32)rand();
      u32 r2 = (u32)rand();
      f32 sign = (r1 > r2) ? 1 : -1;
      
      //
      pa->tx[i] = sign * (f32)rand() / (f32)RAND_MAX;
      pa->ty[i] = (f32)rand() / (f32)RAND_MAX;
      pa->tz[i] = sign * (f32)rand() / (f32)RAND_MAX;

      //
      pa->tvx[i] = (f32)rand() / (f32)RAND_MAX;
      pa->tvy[i] = sign * (f32)rand() / (f32)RAND_MAX;
      pa->tvz[i] = (f32)rand() / (f32)RAND_MAX;
    }
}

//
void move_particles(particle_a *pa, const f32 dt, u32 n, bool vectorized)
{
  //
  const f32 softening = 1e-20;

  //
  #pragma omp parallel num_threads(2)
  {
  #pragma omp for
  for (u32 i = 0; i < n; i++)
    {
      //
      f32 fx = 0.0;
      f32 fy = 0.0;
      f32 fz = 0.0;

      //23 floating-point operation
      for (u32 j = 0; j < n; j++)
	{
	  //Newton's law
	  const f32 dx = pa->tx[j] - pa->tx[i]; //1
	  const f32 dy = pa->ty[j] - pa->ty[i]; //2
	  const f32 dz = pa->tz[j] - pa->tz[i]; //3
	  const f32 d_2 = (dx * dx) + (dy * dy) + (dz * dz) + softening; //9
	  const f32 d_3_over_2 = pow(d_2, 3.0 / 2.0); //11

	  //Net force
	  fx += dx / d_3_over_2; //13
	  fy += dy / d_3_over_2; //15
	  fz += dz / d_3_over_2; //17
	}

      //
      pa->tvx[i] += dt * fx; //19
      pa->tvy[i] += dt * fy; //21
      pa->tvz[i] += dt * fz; //23
    }

  //6 floating-point operations
  #pragma omp for
  for (u32 i = 0; i < n; i++)
    {
      pa->tx[i] += dt * pa->tvx[i];
      pa->ty[i] += dt * pa->tvy[i];
      pa->tz[i] += dt * pa->tvz[i];
    }
  }
}

//
int main(int argc, char **argv)
{
  //
  const u32 n = (argc > 1) ? atoll(argv[1]) : 16384;
  bool vectorized=false;
  if(argc==3)
  {
	if(strcmp(argv[2],"vec")==0)
	{
		vectorized = true;
	}
  }
printf("move\n");
  const u32 steps= 10;
  const f32 dt = 0.01;
  //
  f64 rate = 0.0, drate = 0.0;

  //Steps to skip for warm up
  const u32 warmup = 3;
  
  //
  //particle_t *p = malloc(sizeof(particle_t) * n);
  particle_a *pa = 0;
  const int align = 64;
  int alloc = posix_memalign((void**)&pa, align, sizeof(particle_a));
  alloc = posix_memalign((void**)&pa->tx, align, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->ty, align, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tz, align, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tvx, align, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tvy, align, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tvz, align, n*sizeof(f32)); 
 //
  init(pa, n);

  const u32 s = sizeof(pa)+sizeof(pa->tx); // ?? compl??ter
  
  printf("\n\033[1mTotal memory size:\033[0m %lu B, %lu KiB, %lu MiB\n\n", s, s >> 10, s >> 20);
  
  //
  printf("\033[1m%5s %10s %10s %8s\033[0m\n", "Step", "Time, s", "Interact/s", "GFLOP/s"); fflush(stdout);
  
  //
  for (u32 i = 0; i < steps; i++)
    {
      //Measure
      const f64 start = omp_get_wtime();

      move_particles(pa, dt, n, vectorized);

      const f64 end = omp_get_wtime();

      //Number of interactions/iterations
      const f32 h1 = (f32)(n) * (f32)(n - 1);

      //GFLOPS
      const f32 h2 = (23.0 * h1 + 6.0 * (f32)n) * 1e-9;
      
      if (i >= warmup)
	{
	  rate += h2 / (end - start);
	  drate += (h2 * h2) / ((end - start) * (end - start));
	}

      //
      printf("%5lu %10.3e %10.3e %8.1f %s\n",
	     i,
	     (end - start),
	     h1 / (end - start),
	     h2 / (end - start),
	     (i < warmup) ? "*" : "");
      
      fflush(stdout);
    }

  //
  rate /= (f64)(steps - warmup);
  drate = sqrt(drate / (f64)(steps - warmup) - (rate * rate));

  printf("-----------------------------------------------------\n");
  printf("\033[1m%s %4s \033[42m%10.1lf +- %.1lf GFLOP/s\033[0m\n",
	 "Average performance:", "", rate, drate);
  printf("-----------------------------------------------------\n");
  
  //
  free(pa->tx);
  free(pa->ty);
  free(pa->tz);
  free(pa->tvx);
  free(pa->tvy);
  free(pa->tvz);
  free(pa);

  //
  return 0;
}
