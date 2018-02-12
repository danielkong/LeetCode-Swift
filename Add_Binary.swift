// 67. Add Binary
// Given two binary strings, return their sum (also a binary string).
// For example,
// a = "11"
// b = "1"
// Return "100".

// easy solution:
func addBinary(_ a: String, _ b: String) -> String {
    var sum = 0, carry = 0, res = ""
    let aChars = Array(a.characters), bChars = Array(b.characters)
    var i = aChars.count - 1, j = bChars.count - 1
    
    while i >= 0 || j >= 0 || carry > 0 {
        sum = carry
        if i >= 0 {
            sum += Int(String(aChars[i]))!
            i -= 1
        }
        if j >= 0 {
            sum += Int(String(bChars[j]))!
            j -= 1
        }
        carry = sum / 2
        sum = sum % 2
        res = String(sum) + res
    }
    return res
}

    func addBinary(_ a: String, _ b: String) -> String {
        var aa = Array(a.characters)
        var bb = Array(b.characters)
        var temp = 0
        var output = ""
        while aa.count - 1 >= 0 || bb.count - 1 >= 0 {
            var res: Int = 0
            if aa.count > 0 {
                res += Int(String(aa.removeLast()))!
            }
            if bb.count > 0 {
                res += Int(String(bb.removeLast()))!
            }
            res += temp
            switch res {
                case 0: 
                    temp = 0
                
                case 1: 
                    temp = 0
                
                case 2: 
                    res = 0
                    temp = 1
                
                case 3: 
                    res = 1
                    temp = 1
                default:
                    temp = 0
                
            }
            // output = String(res) + output
            output.insert(contentsOf: String(res).characters, at: output.startIndex)
        }
        if temp != 0 {
            output.insert("1", at: output.startIndex)
        }
        return output
    }

// Solution 2:
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let ach = Array(a.characters.reversed())
        let alen = ach.count
        let bch = Array(b.characters.reversed())
        let blen = bch.count
        
        // make a length < b length
        if alen > blen { return addBinary(b, a) }
        
        var temp = 0
        var res = 0
        
        var resultArr : [Int] = []
        for i in 0 ..< blen {
            if i <= alen-1 {
                res = Int(String(ach[i]))! + Int(String(bch[i]))! + temp
            } else {
                res = Int(String(bch[i]))! + temp
            }
            let test: (Int, Int) = parseRes(res)
            resultArr.append(test.1)
            temp = test.0
        }
        
        if temp == 1 {
            resultArr.append(1)
        }
        
        let stringArray = resultArr.reversed().map{ String($0) }
        
        return stringArray.joined()
    }
    
    private func parseRes(_ res: Int) -> (Int, Int) {
        switch res {
        case 3:
            return (1, 1)
        case 2:
            return (1, 0)
        case 1:
            return (0, 1)
        case 0:
            return (0, 0)
        default:
            return (0, 0)
        }
    }
}
