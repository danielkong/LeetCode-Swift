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
    Inserting And Removing:
        str.insert("i", at: str.startIndex) // insert single char
        str.insert(contentsOf: "best".characters, at: str.index(before:str.endIndex)) // insert contents of another string
        str.remove(at: str.index(before: str.endIndex)) // remove last char
        let range = str.index(str.endIndex, offsetBy: -6)..<str.endIndex
        str.removeSubrange(range) // remove 6 chars

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
    for (index, num) in nums.enumerated() { ... }

String -> Array:
    
    var arr = Array(s.characters) // char array

Char Set: 

    let vowelSet: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]


