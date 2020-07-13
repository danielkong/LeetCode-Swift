// 938. Range Sum of BST
/**
Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).

The binary search tree is guaranteed to have unique values.

Example 1:
Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
Output: 32

Example 2:
Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
Output: 23
 
Note:
The number of nodes in the tree is at most 10000.
The final answer is guaranteed to be less than 2^31.
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

 // Solution 1: recursion

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var ans = 0
        guard let root = root else {
            return 0
        }
        dfs(root, L, R, &ans)
        return ans
    }
    
    private func dfs(_ node: TreeNode, _ l: Int, _ r: Int, _ ans: inout Int) {
        if l <= node.val && node.val <= r {
            ans += node.val
        }
        if l < node.val && node.left != nil {
            dfs(node.left!, l, r, &ans)
        }
        if node.val < r && node.right != nil {
            dfs(node.right!, l, r, &ans)
        }
    } 
}

// Solution 2: iteration

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var ans = 0
        guard let root = root else {
            return 0
        }
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {
            let temp = stack.removeFirst()
            if temp != nil {
                if L <= temp.val && temp.val <= R {
                    ans += temp.val
                }
                if L < temp.val && temp.left != nil {
                    stack.append(temp.left!)
                }
                if temp.val < R && temp.right != nil {
                    stack.append(temp.right!)
                }
            }
        }
        return ans
    }
}