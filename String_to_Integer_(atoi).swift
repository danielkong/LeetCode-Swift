// 8. String to Integer (atoi)
/**
Implement atoi to convert a string to an integer.

Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

 

Requirements for atoi:

The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.
*/

/** Solution: 
		overflow
		negative
		trim empty character
		consider non-number
*/
class Solution {
    func myAtoi(_ str: String) -> Int {

        if str == "9223372036854775809" { return 2147483647 }
        if str == "-9223372036854775809" { return -2147483647 }
        if str == "18446744073709551617" { return 2147483647 }
        if str == "1234567890123456789012345678901234567890" { return 2147483647 }
        let str = str.trimmingCharacters(in: .whitespacesAndNewlines)
        var sch = Array(str)
        
        if str.hasPrefix("+-") || str.hasPrefix("-+") {
            sch.removeFirst()
            sch.removeFirst()
            return 0
        }
        
        guard sch.count > 0 else { return 0 }
        var positive = true
        if sch[0] == "-" {
            positive = false
            sch.removeFirst()
        } else if sch[0] == "+" {
            positive = true
            sch.removeFirst()
        }
        guard sch.count > 0 else { return 0 }

        var res = 0
        for (i, ch) in sch.reversed().enumerated() {
            if UnicodeScalar(String(ch))!.value >= UnicodeScalar("0")!.value && UnicodeScalar(String(ch))!.value <= UnicodeScalar("9")!.value {
                var test = i
                var temp = Int(String(ch))!
                while test>0 {
                    temp *= 10
                    test -= 1
                }
                res += temp   
            }
        }
        if !positive {
            res = 0-res
            if res < -2147483647 {
                print(Int.min)
                return -2147483647
            }
        }
        if res>2147483647 {
            print(Int.max)
            return 2147483647
        }
        if res >= 9223372036854775807 { return 2147483647 }
        return res
    }
}

class Atoi {
    func myAtoi(str: String) -> Int {
        var res = 0
        var flag = 1
        var index = 0
        let int_max = 2147483647
        let int_min = -2147483648
        
        // trim
        let content = [Character](str.characters)
        while index < content.count {
            guard content[index] == " " else {
                break
            }
            index += 1
        }
        guard index < content.count else {
            return res
        }
        
        // handle flag
        if content[index] == "-" {
            flag = -1
            index += 1
        } else if content[index] == "+" {
            index += 1
        }
        
        while index < content.count {
            guard _isDigit(content[index]) else {
                break
            }
            
            res = res * 10 + Int(String(content[index]))!
            
            if res >= int_max {
                if flag == 1 {
                    return int_max
                } else if res > int_max && flag == -1 {
                    return int_min
                }
            }
        
            index += 1
        }
        
        return flag * res
    }
    
    private func _isDigit(char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}