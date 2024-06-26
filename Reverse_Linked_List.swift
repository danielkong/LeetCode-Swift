// 206 Reverse Linked List        43.4%        Easy
/** Reverse a singly linked list.

click to show more hints.

Hint:
A linked list can be reversed either iteratively or recursively. Could you implement both?
*/

// Solution: 1. iterative
//			 2. recursion
class LinkedList: NSObject {
    var next: LinkedList? = nil
    var val: Int

    init(_ value: Int, next:LinkedList? = nil) {
        val = value
        self.next = next
    }
}
let one = LinkedList(1)
let two = LinkedList(2, next: one)
let three = LinkedList(3, next:two)
let four = LinkedList(4, next:three)

func printLinkedList(_ node: LinkedList?) -> Void {
    var varnode = node
    while (varnode != nil) {
        print("\(varnode?.val)")
        varnode = varnode?.next
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head
        
        while curr != nil {
            var next = curr!.next
            curr!.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
 }

func reverseRecursion(_ head: LinkedList?) -> LinkedList? {
    if head == nil || head?.next == nil { return head }

    let temp = head?.next
    head?.next = nil
    let rest = reverseRecursion(temp)
    temp?.next = head

    return rest
}
printLinkedList(four)
let res = reverse(four)
printLinkedList(res)

//

func reverse(_ head: LinkedList?) -> LinkedList? {
    var varhead = head
    if head == nil || head?.next == nil { return head }
    var prev: LinkedList? = nil
    while(varhead != nil) {
        let temp = varhead?.next
        varhead?.next = prev
        prev = varhead
        varhead = temp
    }
    return prev
}

func reverseList(_ head: ListNode?) -> ListNode? {
	if head?.next == nil {
		return head
	}

	let node = reverseList(head!.next)

	head!.next!.next = head
	head!.next = nil
	return node

}
