compile:
	cp fannkuchredux.csharpcore-4.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 12" CSharp fannkuch-redux

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 12

mem:
	/usr/bin/time -v /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 12

valgrind:
	valgrind --tool=massif --stacks=yes /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 12
