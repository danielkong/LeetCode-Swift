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
 */


func addBinary(_ a: String, _ b: String) -> String {
    var res1 = [Character]()
    var ach = a.characters
    var bch = b.characters
    
    var m = 0
    
    while ach.count > 0 && bch.count > 0 {
        let (resdigit, temp) = add(ach.removeLast(), bch.removeLast(), m)
        res1.append(resdigit)
        m = temp
    }
    
    var res2 = addRes((ach.count != 0 ? ach.characters : bch.characters), m)
    
    return res2 + res1.reversed()
}

private func add(_ adigit: Character, _ bdigit: Character, _ m: Int) -> (Character, Int) {
    switch (adigit, bdigit, m) {
    case ("1","1",0) :
        return ("0", 1)
    case ("1","1",1) :
        return ("1", 1)
    case ("1","0",0),
         ("0","0",1),
         ("0","1",0) :
        return ("1", 0)
    case ("0","1",1),
         ("1","0",1) :
        return ("0", 1)
    case ("0","0",0):
        return ("0", 0)
    default : return ("0", 0)
    }
    
}

private func addRes(_ chs: [Character], _ m: Int) -> String {
    var output = [Character]()
    var m = m
    for ch in chs.reversed() {
        switch (Int(String(ch))! + m) {
        case 0:
            output.append("0")
            m = 0
        case 1:
            output.append("1")
            m = 0
        case 2:
            output.append("0")
            m = 1
        }
    }
    return String(output.reversed())
}

let test = addBinary("10", "101")
