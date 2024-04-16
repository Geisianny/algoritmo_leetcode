compile:
	cp knucleotide.csharpcore-6.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < knucleotide-input25000000.txt" CSharp k-nucleotide

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < knucleotide-input25000000.txt

mem:
	/usr/bin/time -v /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < knucleotide-input25000000.txt

valgrind:
	valgrind --tool=massif --stacks=yes /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < knucleotide-input25000000.txt
