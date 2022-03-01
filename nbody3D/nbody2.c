//
#include <omp.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>
#include <stdbool.h>

//
typedef float              f32;
typedef double             f64;
typedef unsigned long      u32;
typedef unsigned long long u64;
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
void move_particles(particle_a *pa, const f32 dt, u32 n)
{
  //
  const f32 softening = 1e-20;

  //
  for (u32 i = 0; i < n; i++)
    {
      //
      f32 fx = 0.0;
      f32 fy = 0.0;
      f32 fz = 0.0;

      //23 floating-point operations

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

  bool vectorization=false;
  int vector_factor = 256/32;

  //with vectorization
  // Using Single Instruction Multiple Data instructions
  if (vectorization)
  {
	__m256 _sumx = _mm256_set_ps(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	__m256 _sumy = _mm256_set_ps(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	__m256 _sumz = _mm256_set_ps(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	__m256 _dt = _mm256_load_ps(&dt);

        for(u32 i = 0; i < n; i+=vector_factor)
        {
  	__m256 vx = _mm256_load_ps(&(pa->tvx[i]));
	__m256 vy = _mm256_load_ps(&(pa->tvy[i]));
	__m256 vz = _mm256_load_ps(&(pa->tvz[i]));	

	_sumx = _mm256_fmadd_ps(_dt, vx, _sumx);
	_sumy = _mm256_fmadd_ps(_dt, vy, _sumy);
	_sumz = _mm256_fmadd_ps(_dt, vz, _sumz);

	_mm256_storeu_ps(&(pa->tx[i]), _sumx);
 	_mm256_storeu_ps(&(pa->ty[i]), _sumy);
 	_mm256_storeu_ps(&(pa->tz[i]), _sumz);

        }
   }

  else
  {
  //6 floating-point operations
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
  const u32 steps= 10;
  const f32 dt = 0.01;

  //
  f64 rate = 0.0, drate = 0.0;

  //Steps to skip for warm up
  const u32 warmup = 3;
  
  //
  //particle_t *p = malloc(sizeof(particle_t) * n);
  particle_a *pa = 0;
  int alloc = posix_memalign((void**)&pa, 32, sizeof(particle_a));
  alloc = posix_memalign((void**)&pa->tx, 32, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->ty, 32, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tz, 32, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tvx, 32, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tvy, 32, n*sizeof(f32));
  alloc = posix_memalign((void**)&pa->tvz, 32, n*sizeof(f32)); 
//
  init(pa, n);

  const u32 s = sizeof(pa)+sizeof(pa->tx); // à compléter
  
  printf("\n\033[1mTotal memory size:\033[0m %lu B, %lu KiB, %lu MiB\n\n", s, s >> 10, s >> 20);
  
  //
  printf("\033[1m%5s %10s %10s %8s\033[0m\n", "Step", "Time, s", "Interact/s", "GFLOP/s"); fflush(stdout);
  
  //
  for (u32 i = 0; i < steps; i++)
    {
      //Measure
      const f64 start = omp_get_wtime();

      move_particles(pa, dt, n);

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
  free(pa);

  //
  return 0;
}
