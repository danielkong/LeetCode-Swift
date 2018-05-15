// 23. Merge k Sorted Lists
/**
Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.


http://www.1point3acres.com/bbs/thread-190778-1-1.html
Given k sorted lists of O(n) integers each, implement an iterator that will yield all elements in sorted order。

大体讨论了几种思路。转换为 linkedlist 做正常的merge，
但较好的思路是直接用iterator来实现大类的next,hasnext和constructor。
希望大家可以贡献想法看看这种思路怎么继续做下去。
面完我所想到的还是新建一个wrapper class, 类似于代替了linklist里面每次指向下一个node。
由于是要sort order，肯定需要维护一个k size 的heap。
*/


// Solution 2: with ! mark
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

 /**
        Idea:   1. Navie. while lists.count > 1 { // merge first two, remove them, append new in lists } O(NM) // N nums of list, M max length of one List
                2. Enhanced. while list.count > 1 { // i = 0, j = count-1 while i<j { mergeTwo } }
                // Since while i < j makes merge half once time, reduce time from O(N) -> O(logN)
        Runtime: O(M * logN)
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else {
            return nil
        }

        var lists = lists
        var left = 0
        var right = lists.count - 1

        while right > 0 {
            left = 0
            while left < right {
                lists[left] = helper(lists[left], lists[right])
                left += 1
                right -= 1
            }
        }
        return lists[0]
    }

    // helper with ! mark
    private func helper(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var res = dummy

        var l = left
        var r = right
        while l != nil && r != nil {
            // if var l = left, var r = right {
                res.next = l!.val < r!.val ? l : r
                if l!.val < r!.val {
                    l = l!.next
                } else {
                    r = r!.next
                }
                res = res.next!
            // }
        }
        res.next = l ?? r

        return dummy.next
    }

    // helper without !
        private func helper(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var res = dummy

        var left = left
        var right = right
        while left != nil && right != nil {
            if let l = left, let r = right {
                res.next = l.val < r.val ? l : r
                if l.val < r.val {
                    left = l.next
                } else {
                    right = r.next
                }
                res = res.next!
            }
        }
        res.next = left ?? right

        return dummy.next
    }
}
