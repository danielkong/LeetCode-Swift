//543. Diameter of Binary Tree
/**
Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

Example:
Given a binary tree
          1
         / \
        2   3
       / \     
      4   5    
Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

Note: The length of path between two nodes is represented by the number of edges between them.
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
// recursion

class Solution {
    var maxPath = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        helper(root)
        return maxPath
    }
    
    func helper(_ node: TreeNode) -> Int {
        // guard let node = node else { return 0 }
        var leftpath = 0, rightpath = 0
        if let leftChild = node.left {
            leftpath = helper(leftChild) + 1
        }
        if let rightChild = node.right {
            rightpath = helper(rightChild) + 1
        }

        maxPath = max(maxPath, leftpath + rightpath)
        return max(leftpath, rightpath)  
    }
}