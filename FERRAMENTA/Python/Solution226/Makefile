compile:
	cp Solution226..python3-7.python3 Solution226.py
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/usr/bin/python3 -OO Solution226.python3-7.py 16000" Python Solution226
run:
	/usr/bin/python3 -OO Solution226.py 16

mem:
	/usr/bin/time -v /usr/bin/python3 -OO Solution226.python3-7.py 16
