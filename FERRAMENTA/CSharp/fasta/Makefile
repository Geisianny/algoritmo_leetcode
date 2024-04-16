compile:
	cp fasta.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 25000000" CSharp fasta

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 25000000

mem:
	/usr/bin/time -v /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 25000000

valgrind:
	valgrind --tool=massif --stacks=yes /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 25000000
