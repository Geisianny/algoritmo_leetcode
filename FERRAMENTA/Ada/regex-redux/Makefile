compile:
	gnatchop -r -w regexredux.gnat-5.gnat
	gnatmake -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp -f regexredux.adb -o regexredux.gnat-5.gnat_run 
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp regexredux.adb
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp block_input.adb
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp dna.ads
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp dna-matching.adb
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp dna-replacing.adb
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp preprocessing.adb
	gcc-9 -c -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -gnatNp u.ads
	gnatbind-9 -x regexredux.ali
	gnatlink-9 regexredux.ali -O3 -fomit-frame-pointer -march=native -msse3 -mfpmath=sse -o regexredux.gnat-5.gnat_run

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "./regexredux.gnat-5.gnat_run 0 < ../../regexredux-input5000000.txt" Ada regex-redux

run:
	./regexredux.gnat-5.gnat_run 0 < ../../regexredux-input5000000.txt
    
mem:
	/usr/bin/time -v ./regexredux.gnat-5.gnat_run 0 < ../../regexredux-input5000000.txt

valgrind:
	valgrind --tool=massif --stacks=yes ./regexredux.gnat-5.gnat_run 0 < ../../regexredux-input5000000.txt
