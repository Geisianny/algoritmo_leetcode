compile:
	cp Solution46.python3 Solution46.py
measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/usr/bin/python3 -OO Solution46.py 21" Python Solution46

run:
	/usr/bin/python3 -OO Solution46.py 21

mem:
	/usr/bin/time -v /usr/bin/python3 -OO Solution46.py 21
