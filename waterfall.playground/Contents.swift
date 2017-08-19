//: Playground - noun: a place where people can play

import UIKit

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
*/

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

