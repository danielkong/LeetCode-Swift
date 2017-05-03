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
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return helper(root!.left, root!.right)
    }
    
    private func helper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if  left!.val == right!.val {
            return helper(left!.left, right!.right) && helper(left!.right, right!.left)
        }
        
        return false
    }
}