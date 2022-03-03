all: nbody.g nbody.i nbody.cl nbody2.g nbody2.i nbody2.cl nbody3.g

nbody.g: nbody.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody2.g:nbody2.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp


nbody3.g:nbody_openmp.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody.i: nbody.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody2.i: nbody2.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody.cl: nbody.c
	clang -Ofast $< -o $@ -fopenmp -march=native

nbody2.cl: nbody2.c
	clang -Ofast $< -o $@ -fopenmp -march=native

clean:
	rm -Rf *~ nbody.g nbody.i nbody.cl nbody2.g nbody2.i nbody2.cl nbody3.g *.optrpt

