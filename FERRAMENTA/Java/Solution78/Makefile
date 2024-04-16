compile:
	cp Solution104.java-2.java Solution78.java
	/usr/local/src/jdk1.8.0_121/bin/javac -d .  Solution78.java
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "java   Solution78 5500" Java Solution78

run:
	/usr/local/src/jdk1.8.0_121/bin/java   Solution78 5500

mem:
	/usr/bin/time -v /usr/local/src/jdk1.8.0_121/bin/java   Solution78 5500

valgrind:
	valgrind --tool=massif --stacks=yes /usr/local/src/jdk1.8.0_121/bin/java   Solution78 5500
