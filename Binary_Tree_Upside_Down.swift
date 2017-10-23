Binary_Tree_Upside_Down.swift

/**
Given a binary tree where all the right nodes are either leaf nodes with a sibling (a left node that shares the same parent node) or empty, flip it upside down and turn it into a tree where the original right nodes turned into left leaf nodes. Return the new root.

For example:
Given a binary tree {1,2,3,4,5},
    1
   / \
  2   3
 / \
4   5
return the root of the binary tree [4,5,2,#,#,3,1].
   4
  / \
 5   2
    / \
   3   1
confused what "{1,#,2,3}" means? > read more on how binary tree is serialized on OJ.
*/

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

// Recursion
class Solution {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        guard let left = root.left else { return root }
        let newRoot = upsideDownBinaryTree(root.left)
        left.left = root.right
        left.right = root
        root.left = nil
        root.right = nil
        return newRoot
    }
}

// Iterative
func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
	var parent: TreeNode?
	var node: TreeNode? = root
	var right: TreeNode?

	while node != nil {
		let left = node!.left
		node!.left = right
		right = node!.right
		node!.right = parent
		parent = node
		node = left
	}

	return parent
}
