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
    char == "[" // character comparing also could use "=="
    arr = Array(str.characters) // Array<Character>
    s = s.substring(to: str.index(before: str.endIndex)) // string without last character
    b = str.hasPrefix("")
    b = str.isEmpty()

    <Substring> substring(with: range) // "Chaitanya".substring(2,5)  => ait
    let s = "Chaita"
    let startIdx = s.index(s.startIndex, offsetBy: 2)
    let endIdx = s.index(s.startIndex, offsetBy: 5)
    let range = startIdx..<endIdx // => ait

    s.substring(with: range)
    let s = "www.stackoverflow.com"
    let start = s.startIndex
    let end = s.index(s.endIndex, offsetBy: -4)
    let substring = s[start..<end] // www.stackoverflow
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
    arr.forEach({ (item: Int) in ... })

For Loop:

    for i in 0...10 { ... } // 0,1,...,10
    for i in 0..<10 { ... } // 0,1,...,9
    for (index, num) in nums.enumerated() { ... }
    for index in stride(from: length, to: 0, by: -1) { ... }

String -> Array:
    
    var arr = Array(s.characters) // char array， otherwise CharacterElement


Char Set: 

    let vowelSet: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

Dictionary:

    contains(key) -> if dict[key] != nil { } else { }
    Note: if var test = dict[key] { test += 1 } // could not add 1 to dict

Tree:

[Binary Tree in Swift](http://lincode.github.io/LeetCode-Binary-Tree)

Swift Only Functions:
1. `map`

    func lengthOf(strings: [Strings]) -> [Int] {
        return strings.map { $0.characters.count }
    } 

2.`flatmap()`
    - Remove `nil` in array
    - Flat nested array into array

![alt text][flatMap]
[flatMap]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/Swift_Coding_Basic_Attachment/flatMap.png

    let files = (1...10).flatMap { try? String(contentsOfFile: "someFile-\($0).txt")}

3. `filter()`
4. `reduce()`
    
    scores = [100, 89, 98]
    let sum = scores.reduce(0, +)
    let res = scores.reduce("") { $0 + String($1) }
    let names = ["Taylor", "Paul", "Adele"]
    let count = names.reduce(0) { $0 + $1.characters.count }
    let longest = names.reduce("") { $1.characters.count > $0.characters.count ? $1 : $0 }
    longest = names.max { $1.characters.count > $0.characters.count }

OOP:
    1. Abstraction
    2. Encapsulation
    3. Inheritance -- Composition (POP: Protocol Oriented Programming)
    4. Polymorphism

    protocol Payable {
        func calculateWages() -> Int
    }

    extension Int {
        func squared() -> Int { // -> Self // return what data type it used be
            return self * self
        }
    }

Example:
    
    protocol Payable {
        func calculateWages() -> Int
    }
    extension Payable {
        func calcualteWages() -> Int {
            return 10,000
        }
    }
    protocol Employee: Payable, HasRestTime, NeedsTraining {}
    struct Receptionist {}
    struct Nurse {}
    struct Doctor {}
    extension Receptionist: Employee {}
    extension Employee where Self: ProvidesTreatment {
        func checkInsureance() {
            print("I'm insured")
        }
    }

[Swift Iterator Protocol](https://developer.apple.com/reference/swift/iteratorprotocol)
    requirements: element / next()

    for animal in animals { ... }
    var animalIterator = animals.makeIterator()
    while let animal = animalIterator.next() { ... }
    Using Iterators Directly:
    extension Sequence {
        func reduce1(
            _ nextPartialResult: (Iterator.Element, Iterator.Element) -> Iterator.Element
        ) -> Iterator.Element?
        {
            var i = makeIterator()
            guard var accumulated = i.next() else {
                return nil
            }
            while let element = i.next() {
                accumulated = nextPartialResult(accumulated, element)
            }
            return accumulated
        }
    }
    let longestAnimal = animals.reduce1 { current, element in
    if current.characters.count > element.characters.count {
        return current
    } else {
        return element
    }
}


