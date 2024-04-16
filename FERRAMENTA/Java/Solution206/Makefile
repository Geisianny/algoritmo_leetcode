compile:
	cp Solution206.java-2.java Solution206.java
	/usr/local/src/jdk1.8.0_121/bin/javac -d .  Solution206.java
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "java   Solution206 5500" Java Solution206

run:
	/usr/local/src/jdk1.8.0_121/bin/java   Solution206 5500

mem:
	/usr/bin/time -v /usr/local/src/jdk1.8.0_121/bin/java  Solution206 5500

valgrind:
	valgrind --tool=massif --stacks=yes /usr/local/src/jdk1.8.0_121/bin/java   Solution206 5500
