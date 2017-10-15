//: Playground - noun: a place where people can play

import UIKit
import Dispatch

var str = "Hello, playground"
/**
func maximalSquare(_ matrix: [[Character]]) -> Int {
    if matrix.count == 0 {
        return 0
    }
    let m = matrix.count, n = matrix[0].count
    var res_side = 0
    var b = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    for i in 1 ... m {
        for j in 1 ... n {
            if String(matrix[i-1][j-1]) == "1" {
                if i == 0 || j == 0 {
                    b[i][j] = 1
                } else {
                    b[i][j] = min(min(b[i][j-1] , b[i-1][j-1]), b[i-1][j]) + 1
                }
                res_side = max(b[i][j], res)
            }
        }
    }
    return res_side*res_side
}
let res = maximalSquare([["1","1","1","1","1"],["1","1","1","1","1"],["1","1","1","1","1"],["1","1","1","1","1"],["1","1","1","1","0"]])

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    guard numCourses > 1 else {
        return true
    }
    
    for temp in prerequisites {
        var test = temp
        for temp2 in prerequisites {
            if temp == temp2 { continue }
            if temp2[0] == test[1] {
                test[1] = temp2[1]
                if test[0] == test[1] {
                    return false }
            }
        }
    }
    return true
}

let res = canFinish(3,[[1,0],[0,2],[2,1]])

 // merge two sorted lists
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let head = ListNode(0)
    var dummy = head
    var l1 = l1, l2 = l2
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            dummy.next = l1
            l1 = l1!.next
        } else {
            dummy.next = l2
            l2 = l2!.next
        }
        dummy = dummy.next!
    }
    if l1 == nil { dummy.next = l2 }
    if l2 == nil { dummy.next = l1 }
    return head.next
}

//Given s = "the sky is blue",
//return "blue is sky the".
func reverseWordInString(_ str: String) -> String {
    let arr = str.components(separatedBy: " ").reversed()
    return arr.joined(separator: " ")
}
let res = reverseWordInString("the sky is blue")


func reversedBits(_ n: UInt32) -> UInt32 {
    var n: UInt32 = n
    var m: UInt32 = 0
    var i: UInt32 = 32
    while i > 0 && n != 0  {
        m = m << 1 + n & 0b1
        n = n >> 1
        i -= 1
    }
    m << i
    return m
}

let res = reversedBits(1) // 2147483648

//let queue = dispatch_queue_create("me.tutuge.test.gcd", DISPATCH_QUEUE_SERIAL)

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    for ch in s.characters {
        switch ch {
        case "(",
             "[",
             "{" :
            stack.append(ch)
        case ")" :
            if stack.last == "(" {
                stack.removeLast()
            } else {
                return false
            }
        case "]" :
            if stack.last == "[" {
                stack.removeLast()
            } else {
                return false
            }
        case "}" :
            if stack.last == "{" {
                stack.removeLast()
            } else {
                return false
            }
        default: break
            
        }
    }
    return true
}
let res = isValid("[[b(a)]]")

func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
    var sum = 0
    var max_num = 0
    var dict = [Int: Int]()
    for (i, val) in nums.enumerated() {
        sum += val
        if sum == k { max_num = max(max_num, i + 1) }
        else if dict[sum-k] != nil {
            max_num = max(max_num, i - dict[sum-k]!)
        }
        if dict[sum] == nil { dict[sum] = i }
    }
    return max_num
}

let test = maxSubArrayLen([-2,-1,2,1], 1)

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var map = [Int: Int]()
    let test = ("A".unicodeScalars.filter{$0.isASCII}.first?.value)!
    for ch in tasks {
        let test2 = (String(ch).unicodeScalars.filter{$0.isASCII}.first?.value)!
        let diff = Int(test2 - test)
        if map[diff] == nil {
            map[diff] = 1
        } else {
            map[diff]! += 1
        }
    }
    var sortedMap = Array(map).sorted(by: { $0.1 < $1.1 })
    var max_val = sortedMap[sortedMap.count-1].value-1 // 2
    var idle_slots = max_val * (n+1)  // 12
    var temp = 0
    for i in stride(from: sortedMap.count-1, to: -1, by: -1) {
        print(sortedMap[i].value)
        if sortedMap[i].value-1 == max_val {
            temp += 1
            print("temp:\(temp)")
        }
    }
    return temp + idle_slots

}
let rest = leastInterval(["A","B","C","D","E","A","B","C","D","E"], 4)
 int max_val = map[25] - 1, idle_slots = max_val * n;
 for (int i = 24; i >= 0 && map[i] > 0; i--) {
    idle_slots -= Math.min(map[i], max_val);
 }
 return idle_slots > 0 ? idle_slots + tasks.length : tasks.length;

 */

/**
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
      self.start = start
      self.end = end
    }
}
 
func minMeetingRooms(_ intervals: [Interval]) -> Int {
    guard intervals.count > 0 else { return 0 }
    var count = 0
    var starts = [Int]()
    var ends = [Int]()
    
    for item in intervals {
        starts.append(item.start)
        ends.append(item.end)
    }
    
    starts.sort()
    ends.sort()
    
    var i = 0
    var j = 0
    while i < starts.count && j < ends.count {
        if starts[i] < ends[j] {
            count += 1
            i += 1
        } else {
            i += 1
            j += 1
        }
    }
    
    return count
}

let res = minMeetingRooms([Interval(9,10), Interval(4,9), Interval(4,17)])
 
let dict: [Character: [Character]] = ["2" : ["a", "b", "c"],
"3" : ["d", "e", "f"],
"4" : ["g", "h", "i"],
"5" : ["j", "k", "l"],
"6" : ["m", "n", "o"],
"7" : ["p", "q", "r", "s"],
"8" : ["t", "u", "v"],
"9" : ["w", "x", "y", "z"],
]

func letterCombinations(_ digits: String) -> [String] {
    let temp = ""
    var res = [String]()
    
    helper([Character](digits.characters), 0, digits.characters.count, &res, temp)
    
    return res
}

func helper(_ chs: [Character], _ idx: Int, _ end: Int, _ res: inout [String], _ temp: String) {
    var temp = temp
    if idx == end {
        res.append(temp)
        return
    }
    
    if let ch: Character = chs[idx] {
        let map: [Character] = dict[ch]!
        
        for i in 0 ..< map.count {
            temp.append(map[i])
            helper(chs, idx+1, end, &res, temp)
            temp = String(temp.characters.dropLast())
        }
    }
}

func numDecodings(_ s: String) -> Int {
    let sChars = [Character](s.characters), len = sChars.count
    var dp = Array(repeating: 0, count: len + 1)
    dp[0] = 1
    
    guard len >= 1 else {
        return 0
    }
    
    for i in 1 ... len {
        print("testing " + String(sChars[i - 1 ..< i]))
        if isValid(String(sChars[i - 1 ..< i])) {
            print(1)
            dp[i] += dp[i - 1]
        }
        if i >= 2 && isValid(String(sChars[i - 2 ..< i])) {
            print(12)
            dp[i] += dp[i - 2]
        }
    }
    
    return dp[len]
}

private func isValid(_ numStr: String) -> Bool {
    if Array(numStr.characters).first == "0" {
        return false
    }
    
    guard let num = Int(numStr) else {
        return false
    }
    
    return num >= 1 && num <= 26
}

let res = numDecodings("101")
print(res)

func numDecodings(_ s: String) -> Int {
    let chs = Array(s.characters)
    let len = chs.count
    
    var dp = Array(repeating: 0, count:2)
    dp[0] = ways(String(chs[0]))
    print(dp[0])
    if len < 2 { return dp[0] }
    
    dp[1] = dp[0] * ways(String(chs[1])) + ways(String(chs[0]), String(chs[1]))
    
    for i in 2 ..< len {
        let temp = dp[1]
        let test = dp[1] * ways(String(chs[i]))
        let finish = dp[0] * ways(String(chs[i-1]), String(chs[i]))
        dp[1] = (test + finish) % 1000000007
        dp[0] = temp
    }
    
    return dp[1]
}

func ways(_ ch: String) -> Int {
    if ch == "*" { return 9 }
    if ch == "0" { return 0 }
    return 1
}

func ways(_ ch1: String, _ ch2: String) -> Int {
    if ch1 == "*" && ch2 == "*" {
        return 15
    } else if ch1 != "*" && ch2 == "*" {
        print("here")
        if let int1 = Int(ch1) {
            print("here: \(int1)")
            if int1 == 1 { return 9 }
            else if int1 == 2 { return 6 }
        }
    } else if ch1 == "*" && ch2 != "*" {
        if let int2 = Int(ch2) {
            if int2 >= 0 && int2 <= 6 {
                return 2
            } else {
                return 1
            }
        }
    } else {
        if let combine = Int(ch1 + ch2) {
            if combine >= 10 && combine <= 26 { return 1 }
        }
    }
    
    return 0
}

let res = numDecodings("1*")
*/

func isMatch(_ s: String, _ p: String) -> Bool {
    print("ssss: \(s)")
    print("ppppp: \(p)")
    if p == s { return true }
    if p == "" { return s == "" }
    let pch = Array(p.characters)
    let sch = Array(s.characters)
    let first_match = (s != "" && pch[0] == sch[0] || pch[0] == ".")
    if pch.count >= 2 && pch[1] == "*" {
        print("testing")
        return isMatch(s, String(pch[2..<pch.count])) || (first_match && (sch.count == 0 ? false : isMatch(String(sch[1..<sch.count]), p)))
        // ismatch(ab, c) <false>|| (true) && (b, .*c) ->
        //                              (b, c)<false> || true && ("", .*c)
        //                                                      ("", c) || false &&
    } else {
        print("testing2")
        print(first_match)
        print(s == "")
        print(p)
//        if sch.count == 0 && pch.count > 0 {
//            print("here")
//            return false
//
//        }
        return first_match && (sch.count == 0 ? false : isMatch(String(sch[1..<sch.count]), String(pch[1..<pch.count])))

    }
}

let res = isMatch("ab", ".*c")

//let s = "a"
//let sch = Array(s.characters)
//print(String(sch[1..<sch.count]))


