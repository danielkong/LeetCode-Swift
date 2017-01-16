Swift Coding Basic 

String:

	length = str.characters.count
    str.characters // String.CharacterView
    str.characters.dropFirst()
    str.characters.dropFirst(2)
    str.characters.dropLast()
    str.characters.popFirst/Last
	<String Indices>
	char = str[str.startIndex] // first character
	char = str[str.index(before: str.endIndex)] // last character
	char = str[str.index(after: str.startIndex)] // sec character
	char = str[str.index(str.startIndex, offsetBy: 3)] // 4th character
    char = str.characters.first // return first Char. == "A" true
    char = str.characters.last 
    arr = Array(str.characters) // Array<Character>
    s = s.substring(to: str.index(before: str.endIndex)) // string without last character
    b = str.hasPrefix("")
    b = str.isEmpty()

Int:

    Int.max // max_value

Array:

    arr.sort{ $0.name < $1.name } // sorted array of string 
    arr.sorted()
    arr.insert("add", atIndex: 1)
    arr.removeFirst()
    arr.removeLast()
    arr.remove(at: 2)
    arr.index(of: "chimps")
    arr.filter() {$0 != "chimps"}
    arr.contains(ch) // arr contain char value

For Loop:

    for i in 0...10 { ... } // 0,1,...,10
    for i in 0..<10 { ... } // 0,1,...,9

String -> Array:
    
    var arr = Array(s.characters) // char array

Char Set: 

    let vowelSet: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]


