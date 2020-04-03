// 100. Same Tree
/**
Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

Example 1:

Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true
Example 2:

Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false
Example 3:

Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false
*/
/**
 Solution 1: Recursion
 			Runtime: O(N)
 			Space: O(logN) for balanced tree, and O(N) for worst case.
*/
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let p = p, let q = q else { return false }
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}