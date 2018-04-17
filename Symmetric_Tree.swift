// 101. Symmetric Tree

// Solution Swift: time O(n) space O(n)
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
/** Idea: Recursion
            1. root nil
            2. root.left and root.right should be mirror
 Runtime: O(N)
   Space: O(N)
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return helper(root.left, root.right)
        
    }
    
    func helper(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        guard let left = leftNode, let right = rightNode else {
            if leftNode == nil && rightNode == nil { return true }
            else { return false }
        }
        if left.val == right.val {
            return helper(left.left, right.right) && helper(left.right, right.left)
        } else {
            return false
        }
    }
}
