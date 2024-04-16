compile:
	cp binarytrees.csharpcore-4.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 21" CSharp binary-trees

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 21

mem:
	/usr/bin/time -v  /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 21

valgrind:
	valgrind --tool=massif --stacks=yes  /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 21
