all: nbody.g nbody.i nbody.cl

nbody.g: nbody.c
	gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody.i: nbody.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody.cl: nbody.c
	clang -Ofast $< -o $@ -fopenmp

clean:
	rm -Rf *~ nbody.g nbody.i nbody.cl *.optrpt

