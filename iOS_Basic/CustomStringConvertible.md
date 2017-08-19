CustomStringConvertible (from printable)
    auto-describing objects

    class Dog: CUstomStringConvertible {
        let name: String
        let age: Int
        let color: String
        init(name: String, age: Int, color: String) {
            self.name = name
            self.age = age
            self.color = color
        }
        var description: String {   // need to conform protocol
            var description = ""
            description += "name: \(name)\n"
            description += "age: \(age)\n"
            description += "color: \(color)\n"
            return description
        }
    }

But it's not automated adding description. We need to write it for every class.


Accessibility 
accessibilityLabel is voiceOver read
isAccessibilityElement: Bool - set whether voiceOver, if true, it's subview not accessibility then.
