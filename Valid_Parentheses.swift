// 20. Valid Parentheses
// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

/**
 * Question Link: https://leetcode.com/problems/valid-parentheses/
 * Primary idea: Use a stack to see whether the peek left brace is correspond to the current right one
 * Time Complexity: O(n), Space Complexity: O(n)
 */

    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for ch in s.characters {
            switch ch {
                case "(",
                     "[",
                     "{":
                    stack.append(ch)
                case ")":
                    guard stack.count > 0 && stack.removeLast() == "(" else {
                        return false
                    }
                case "]":
                    guard stack.count > 0 && stack.removeLast() == "[" else {
                        return false
                    }
                case "}":
                    guard stack.count > 0 && stack.removeLast() == "{" else {
                        return false
                    }
                default:
                    break
            }
        }
        return stack.count == 0
    }
