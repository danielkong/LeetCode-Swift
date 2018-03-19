24. Swap Nodes in Pairs
/**
Given a linked list, swap every two adjacent nodes and return its head.

For example,
Given 1->2->3->4, you should return the list as 2->1->4->3.

Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
*/
// Solution:
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard var currentPeriod: ListNode? = head else { return head }
        if currentPeriod?.next == nil { return head }
        let newhead = head?.next 
        var previousPeriod: ListNode?
        
        while currentPeriod != nil {
            var first = currentPeriod
            var second = first?.next 
            var nextPeriod = second?.next

            if second != nil {
                previousPeriod?.next = second       
            }
            
            second?.next = first
            first?.next = nextPeriod

            previousPeriod = first
            currentPeriod = nextPeriod  
            
        }
        return newhead
    }
}

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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let newHead = head?.next else {
            return head
        }
        
        var current = head
        var previous: ListNode?

        while current != nil, let next = current?.next {
            current?.next = next.next
            next.next = current
            previous?.next = next
            previous = current
            current = next.next?.next
        }

        return newHead
    }
}