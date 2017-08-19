// 104. Maximum Depth of Binary Tree
/**
Given a binary tree, find its maximum depth.
The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
*/
/**
* Primary idea: recursion (Fibonaci, stairs), return 0 when it is a leaf node
* Time Complexity: O(n), Space Complexity: O(n)
*/
// Solution 1: bfs
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.left == nil && root.right == nil {
            return 1
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
