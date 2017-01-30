
// 38        Count and Say        32.5%        Easy        
/**
The count-and-say sequence is the sequence of integers beginning as follows:
1, 11, 21, 1211, 111221, ...

1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.
Given an integer n, generate the nth sequence.

Note: The sequence of integers will be represented as a string.
*/
    func countAndSay(_ n: Int) -> String {
        guard n > 0 else {
            return ""
        }
  
        var res = "1"
        var temp: String
        var count: Int
        var chars: [Character]
        var current: Character
  
        for _ in 1 ..< n{
            temp = ""
            count = 1
            chars = [Character](res.characters)
            current = chars[0]
    
            for i in 1 ..< chars.count {
                if chars[i] == current {
                    count += 1
                } else {
                    temp.append(Character("\(count)"))
                    temp.append(current)
                    count = 1
                    current = chars[i]
                }
            }
            temp.append(Character("\(count)"))
            temp.append(current)
    
            res = temp
        }
  
        return res
    }