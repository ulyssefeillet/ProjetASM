all: nbody.g nbody.i nbody.cl nbody_v2_struct.g nbody_v2_struct.i nbody_v2_struct.cl nbody_v3_openmp.g nbody_v3_openmp.i nbody_v3_openmp.cl

nbody.g: nbody.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody_v2_struct.g:nbody_v2_struct.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody_v3_openmp.g:nbody_openmp.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody.i: nbody.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody_v2_struct.i: nbody_v2_struct.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody_v3_openmp.i: nbody_openmp.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody.cl: nbody.c
	clang -Ofast $< -o $@ -fopenmp -march=native

nbody_v2_struct.cl: nbody_v2_struct.c
	clang -Ofast $< -o $@ -fopenmp -march=native

nbody_v3_openmp.cl: nbody_openmp.c
	clang -Ofast $< -o $@ -fopenmp -march=native

clean:
	rm -Rf *~ nbody.g nbody.i nbody.cl nbody_v2_struct.g nbody_v2_struct.i nbody_v2_struct.cl nbody_v3_openmp.g nbody_v3_openmp.i nbody_v3_openmp.cl *.optrpt

