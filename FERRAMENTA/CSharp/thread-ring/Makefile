compile:
	cp threadring.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 50000000"

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 50000000
