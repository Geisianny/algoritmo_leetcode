compile:
	cp Solution48.python3-3.python3 Solution48.python.py
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/usr/local/src/Python-3.6.1/bin/python3.6 -OO Solution48.python3-3.py 0" Python Solution48

run:
	/usr/local/src/Python-3.6.1/bin/python3.6 -OO Solution48.python3-3.py 

mem:
	/usr/bin/time -v /usr/local/src/Python-3.6.1/bin/python3.6 -OO Solution48.python3-3.py 
