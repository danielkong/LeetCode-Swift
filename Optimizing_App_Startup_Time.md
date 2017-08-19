## Optimizing App Startup Time [WWDC2016 406]

Linker, loader and you
Nick -- Dyld Architect
Louis -- Dyld Visionary

 What happens before main()
 Mach-O and Virtual Memory
 	executable
	dylib
	bundle
	image -- an executable, ydlib, or bundle
	framework -- dylib with directory for resources and headers
	Mach-O image file
		file divided into segments
		uppercase names: text, data, linkedit
		all segments are multiples of page size
			16KB on arm64
			4KB else where

		__TEXT: header, code, and read-only constants
		__DATA: all read-write content: globals, static variables, etc
		__LINKEDIT: meta data about how to load the program

	Mach-O Universal Files
		arm64 default, armv7s(for 32-bit)

Virtual Memory is a level of indirection


:(
