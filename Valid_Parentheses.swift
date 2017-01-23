// 20. Valid Parentheses
// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

// Solution: Stack 

func validParentheses(_ input: String) -> Bool {
    var stack: [Character] = []
    for ch in input.characters {
        if ch == "(" || ch == "[" || ch == "{" {
            stack.append(ch)
        } else {
            if stack.isEmpty {
                return false
            } else {
                switch stack.last! {
                    case "(":
                        if ch == ")" {
                            stack.popLast()
                        } else {
                            return false
                        }
                    case "[":
                        if ch == "]" { 
                            stack.popLast() 
                        } else {
                            return false
                        }
                    case "{":
                        if ch == "}" {
                            stack.popLast() 
                        } else {
                            return false
                        }
                    default: return false
                }
            }
        }
    }
    return stack.isEmpty
}
