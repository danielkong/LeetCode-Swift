// 282        Expression Add Operators        28.5%        Hard        
/**
Given a string that contains only digits 0-9 and a target value, return all possibilities to add binary operators (not unary) +, -, or * between the digits so they evaluate to the target value.

Examples: 
"123", 6 -> ["1+2+3", "1*2*3"] 
"232", 8 -> ["2*3+2", "2+3*2"]
"105", 5 -> ["1*0+5","10-5"]
"00", 0 -> ["0+0", "0-0", "0*0"]
"3456237490", 9191 -> []
*/

class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        helper(&res, "", Array(num.characters), target, 0, 0, 0)
        return res
    }
    
    private func helper(_ res: inout [String], _ str: String, _ numChars: [Character], _ target: Int, _ pos: Int, _ currentAccum: Int, _ prevNum: Int) {
        if pos == numChars.count {
            if currentAccum == target {
                res.append(str)
            }
            return 
        }
        
        for i in pos ..< numChars.count {
            if i != pos && numChars[pos] == "0" {
                break
            }
            
            let current = Int(String(numChars[pos ..< i+1]))!
            
            if pos == 0 {
                helper(&res, str + String(current), numChars, target, i + 1, current, current)
            } else {
                helper(&res, str + "+" + String(current), numChars, target, i + 1, currentAccum + current, current)
                helper(&res, str + "-" + String(current), numChars, target, i + 1, currentAccum - current, -current)
                helper(&res, str + "*" + String(current), numChars, target, i + 1, currentAccum - prevNum + prevNum * current, prevNum * current)
            }
        }
    }
}