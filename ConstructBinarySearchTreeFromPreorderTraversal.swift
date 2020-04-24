// 1008. Construct Binary Search Tree from Preorder Traversal
/**
Return the root node of a binary search tree that matches the given preorder traversal.

(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

 

Example 1:

Input: [8,5,1,7,10,12]
Output: [8,5,10,1,7,null,12]

 

Note: 

1 <= preorder.length <= 100
The values of preorder are distinct.
*/
// Solution 1: Iteration. Stack
// Runtime: O(N)
// Space: O(N)

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
    guard preorder.count >= 1 else { return nil }
    //Input: [8,5,1,7,10,12]
    //Output: [8,5,10,1,7,null,12]
    let root = TreeNode(preorder[0])
    var stack = [root]
    for i in 1..<preorder.count {
        var temp = stack.last!
        while !stack.isEmpty && stack.last!.val < preorder[i] {
            temp = stack.removeLast()
        }
        let child = TreeNode(preorder[i])
        if temp.val < preorder[i] {
            temp.right = child
        } else {
            temp.left = child
        }
        stack.append(child)
    }
    return root
}
}