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

