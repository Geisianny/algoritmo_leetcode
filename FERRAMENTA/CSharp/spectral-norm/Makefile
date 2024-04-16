compile:
	cp spectralnorm.csharpcore-3.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 5500" CSharp spectral-norm

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 5500

mem:
	/usr/bin/time -v /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 5500

valgrind:
	valgrind --tool=massif --stacks=yes /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 5500
