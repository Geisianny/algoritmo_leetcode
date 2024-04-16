compile:
	cp Solution94.java-2.java Solution94.java
	/usr/local/src/jdk1.8.0_121/bin/javac -d .  Solution94.java
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "java  Solution94 5500" Java Solution94

run:
	/usr/local/src/jdk1.8.0_121/bin/java   Solution94 5500

mem:
	/usr/bin/time -v /usr/local/src/jdk1.8.0_121/bin/java   Solution94 5500

valgrind:
	valgrind --tool=massif --stacks=yes /usr/local/src/jdk1.8.0_121/bin/java   Solution94 5500
