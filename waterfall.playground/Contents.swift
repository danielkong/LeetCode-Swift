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
/**
 int max_val = map[25] - 1, idle_slots = max_val * n;
 for (int i = 24; i >= 0 && map[i] > 0; i--) {
    idle_slots -= Math.min(map[i], max_val);
 }
 return idle_slots > 0 ? idle_slots + tasks.length : tasks.length;

 */
