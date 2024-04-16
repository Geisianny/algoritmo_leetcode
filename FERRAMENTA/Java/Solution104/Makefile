compile:
	cp Solution104.java-2.java Solution104.java
	/usr/local/src/jdk1.8.0_121/bin/javac -d .  Solution104.java
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "java   Solution104 5500" Java Solution104

run:
	/usr/local/src/jdk1.8.0_121/bin/java   Solution104 5500

mem:
	/usr/bin/time -v /usr/local/src/jdk1.8.0_121/bin/java   Solution104 5500

valgrind:
	valgrind --tool=massif --stacks=yes /usr/local/src/jdk1.8.0_121/bin/java   Solution104 5500
