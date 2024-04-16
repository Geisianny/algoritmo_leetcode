compile:
	cp regexredux.csharpcore-4.csharpcore Program.cs
	/snap/bin/dotnet build -c Release

measure:
	sudo modprobe msr
	sudo ../../RAPL/main "/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < ../../regexredux-input5000000.txt" CSharp regex-redux

run:
	/snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < ../../regexredux-input5000000.txt

mem:
	/usr/bin/time -v /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < ../../regexredux-input5000000.txt

valgrind:
	valgrind --tool=massif --stacks=yes /snap/bin/dotnet ./bin/Release/netcoreapp1.1/tmp.dll 0 < ../../regexredux-input5000000.txt
