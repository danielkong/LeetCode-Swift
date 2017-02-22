// 43        Multiply Strings        25.9%        Medium        
/**
Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.

Note:

The length of both num1 and num2 is < 110.
Both num1 and num2 contains only digits 0-9.
Both num1 and num2 does not contain any leading zero.
You must not use any built-in BigInteger library or convert the inputs to integer directly.
*/

class MultiplyStrings {
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else {
            return "0"
        }
        
        let num1Chars = Array(num1.characters.reversed())
        let num2Chars = Array(num2.characters.reversed())
        var res = Array(repeating: 0, count: num1Chars.count + num2Chars.count)
        var finalChars = [String](), carry = 0, sum = 0
        
        for (i, char1) in num1Chars.enumerated() {
            let n1 = Int(String(char1))
            for (j, char2) in num2Chars.enumerated() {
                res[i + j] += n1! * Int(String(char2))!
            }
        }
        
        for num in res {
            sum = (carry + num) % 10
            carry = (carry + num) / 10
            finalChars.insert(String(sum), at: 0)
        }
        
        while !finalChars.isEmpty && finalChars.first! == "0" {
            finalChars.removeFirst()
        }
        
        return finalChars.reduce("") { $0 + $1 }
    }
}
