compile:
	/usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer -march=native -fopenmp -D_FILE_OFFSET_BITS=64 -I/usr/include/apr-1.0 Solution118.gcc-3.c -o Solution118.gcc-3.gcc_run -lapr-1 -lgomp -lm
	
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "./Solution118.gcc-3.gcc_run 21" C Solution118

run:
	./Solution118.gcc-3.gcc_run 21

mem:
	/usr/bin/time -v ./Solution118.gcc-3.gcc_run 21
