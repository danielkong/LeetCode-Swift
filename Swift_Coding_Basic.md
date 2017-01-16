Swift Coding Basic 

String:

	length = str.characters.count
	<String Indices>
	char = str[str.startIndex] // first character
	char = str[str.index(before: str.endIndex)] // last character
    	s = s.substring(to: str.index(before: str.endIndex)) // string without last character
	char = str[str.index(after: str.startIndex)] // sec character
	char = str[str.index(str.startIndex, offsetBy: 3)] // 4th character
	str.characters.first
	str.characters.last
    	str.hasPrefix("")
    	str.isEmpty()

Int:

    	Int.max // max_value

Array:

    	arr.sort{ $0.name < $1.name } // sorted array of string 

For Loop:

    	for i in 0...10 { ... } // 0,1,...,10
    	for i in 0..<10 { ... } // 0,1,...,9

