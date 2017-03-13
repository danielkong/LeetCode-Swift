// 23. Merge k Sorted Lists
/**
Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
*/

// 
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