// 394. Decode String   Medium
/**
Given an encoded string, return its decoded string.

The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

Examples:

s = "3[a]2[bc]", return "aaabcbc".
s = "3[a2[c]]", return "accaccacc".
s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
*/
/**
    Confirm: 1. always right format? number [] and character 
             2. two or more digits allows? 

    Solution 1: Stack -- store prev str and number. 
*/

class Item {
    var num: Int = 0
    var str: String = ""

    init(num: Int, str: String) {
        self.num = num
        self.str = str
    }
}

class Solution {
    func decodeString(_ s: String) -> String {
        let chs = Array(s)
        var stack = [Item]()

        var currNum = 0
        var currStr = ""
        var res = ""
        for i in 0..<chs.count {
            if let num = Int(String(chs[i])) {
                currNum = currNum*10 + num
            } else if chs[i] == "[" {
                let curItem = Item.init(num: currNum, str: currStr)
                stack.append(curItem)
                currNum = 0
                currStr = ""
            } else if chs[i] == "]" {
                let lastItem = stack.removeLast()
                var temp = ""
                for _ in 0..<lastItem.num {
                    temp += currStr
                }
                lastItem.str += temp
                currStr = lastItem.str
            } else {
                currStr += String(chs[i])
            }
        }
        if currStr != "" {
            res += currStr
        }
        return res
    }
}

// Another solution with stack

class Item{
    var count:Int = 0
    var str:String = ""
}

class Solution {
     func decodeString(_ s: String) -> String {
        let n = s.count
        var stack:[Item] = []
        let arr = Array(s)
        let head = Item()
        var curr = head
        var num = 0
        for i in 0..<n{
            let c = arr[i]
            if let intVal = Int(String(c)){
                num = 10*num + intVal
            } else {
                if c == "["{
                    let nItem = Item()
                    nItem.count = num
                    stack.append(curr)
                    curr = nItem
                    num = 0
                }else if c == "]"{
                    var str = ""
                    for i in 0..<curr.count{
                        str += curr.str
                    }
                    curr = stack.popLast()!
                    curr.str += str
                }else{
                    curr.str += String(c)
                }
            }
        }
        return head.str
     }
}