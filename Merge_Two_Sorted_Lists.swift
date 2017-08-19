// 21. Merge Two Sorted Lists
// Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

// Runtime: O(M+N) Space: O(N)
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
}
