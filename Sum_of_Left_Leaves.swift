// 404        Sum of Left Leaves        45.7%        Easy   
/**
Find the sum of all left leaves in a given binary tree.

Example:

    3
   / \
  9  20
    /  \
   15   7

There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
*/
/**
 * Question Link: https://leetcode.com/problems/sum-of-left-leaves/
 * Primary idea: Recursion. Go to left and right and add to res if it is left leaf.
 * Time Complexity: O(n), Space Complexity: O(1)
 *
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

    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var res = 0
        if let left = root.left {
            res = recursive(left, true, res)
        }
        if let right = root.right {
            res = recursive(right, false, res)
        }
        
        return res
    }
    
    private func recursive(_ node: TreeNode, _ isLeft: Bool, _ temp: Int) -> Int {
        var res = temp
        if isLeft && node.left == nil && node.right == nil {
            res += node.val
        }
        if let left = node.left {
            res += recursive(left, true, res)
        }
        if let right = node.right {
            res += recursive(right, false, res)
        }
        return res
    }