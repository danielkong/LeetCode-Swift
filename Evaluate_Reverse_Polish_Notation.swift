// 150. Evaluate Reverse Polish Notation
/**
Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are +, -, *, /. Each operand may be an integer or another expression.

Note:

Division between two integers should truncate toward zero.
The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.

Example 1:
    Input: ["2", "1", "+", "3", "*"]
    Output: 9
    Explanation: ((2 + 1) * 3) = 9

Example 2:
    Input: ["4", "13", "5", "/", "+"]
    Output: 6
    Explanation: (4 + (13 / 5)) = 6

Example 3:
    Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
    Output: 22
    Explanation: 
      ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
    = ((10 * (6 / (12 * -11))) + 17) + 5
    = ((10 * (6 / -132)) + 17) + 5
    = ((10 * 0) + 17) + 5
    = (0 + 17) + 5
    = 17 + 5
    = 22
*/
/**
    Idea: Use Stack to save Int, when meet operation, calculate it.
    Runtime: O(N)
    Space: O(N/2)
*/

class Solution {
    // Stack: store number, meet a operators pop two and res put into stack. 9.25
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for ch in Array(tokens) {
            if let num = Int(ch) {
                stack.append(num)
            } else {
                let a = stack.removeLast()
                var b = stack.removeLast()
                b = calculate(a, b, ch)
                stack.append(b)
            }
        }
        return stack.first!
    }
    
    func calculate(_ a: Int, _ b: Int, _ ch: String) -> Int {
        switch ch {
            case "+":
                return a+b
            case "-":
                return b-a
            case "*":
                return b*a
            case "/":
                return b/a
            default:
                return 0
        }
    }
}