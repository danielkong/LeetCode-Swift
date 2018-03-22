// 171. Excel Sheet Column Number
/**
Related to question Excel Sheet Column Title

Given a column title as appear in an Excel sheet, return its corresponding column number.

For example:

    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
*/

// Solution Swift:

class Solution {
    func titleToNumber(_ s: String) -> Int {
        var sum = 0
        for char in s.unicodeScalars  {
            sum *= 26
            sum += (Int(char.value) - 64) 
        }
        return sum
    }
}

    func titleToNumber(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let sch = Array(s.reversed())
        var res = 0


        for (i, ch) in sch.enumerated() {
            let ich = UnicodeScalar(String(ch))!.value
            let ach = UnicodeScalar("A")!.value
            let digitValue = Int(ich - ach + 1)

            var times = i
            var test = 1
            while times >= 1 {
                test *= 26
                times -= 1
            }
            res += digitValue*test
        }
        return res
    }