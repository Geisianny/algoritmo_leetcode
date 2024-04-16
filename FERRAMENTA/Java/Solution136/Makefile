compile:
	cp Solution136.java-2.java Solution136.java
	/usr/local/src/jdk1.8.0_121/bin/javac -d .  Solution136.java
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "java   Solution136 5500" Java Solution136

run:
	/usr/local/src/jdk1.8.0_121/bin/java   Solution136 5500

mem:
	/usr/bin/time -v /usr/local/src/jdk1.8.0_121/bin/java   Solution136 5500

valgrind:
	valgrind --tool=massif --stacks=yes /usr/local/src/jdk1.8.0_121/bin/java   Solution136 5500
