compile:
	cp Solution22.java-2.java Solution22.java
	/usr/local/src/jdk1.8.0_121/bin/javac -d .  Solution22.java
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "java   Solution22 5500" Java Solution22

run:
	/usr/local/src/jdk1.8.0_121/bin/java   Solution22 5500

mem:
	/usr/bin/time -v /usr/local/src/jdk1.8.0_121/bin/java   Solution22 5500

valgrind:
	valgrind --tool=massif --stacks=yes /usr/local/src/jdk1.8.0_121/bin/java   Solution22 5500
