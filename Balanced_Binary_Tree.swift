// 110. Balanced Binary Tree
/**
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example 1:

Given the following tree [3,9,20,null,null,15,7]:

    3
   / \
  9  20
    /  \
   15   7
Return true.

Example 2:

Given the following tree [1,2,2,3,3,null,null,4,4]:

       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
Return false.
*/
/**
	 Idea: Make sure left and right node depth < 2, and also make sure left, right is Balanced as well.
	 Runtime: O(N) (Iterative)
	 Space: O(1)
*/
// Recursion Swift: 
// Top-down: O(N^2)
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        // bfs
        guard let root = root else { return true }
        
        let left = depth(root.left)
        let right = depth(root.right)
        
        return abs(left-right) < 2 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    func depth(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return max(depth(node.left), depth(node.right)) + 1
    }
}

// Iteration Solution
// Bottom-up O(N)
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return dfs(root) != -1
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var leftHeight = dfs(root.left)
        if leftHeight == -1 { return -1 }
        var rightHeight = dfs(root.right)
        if rightHeight == -1 { return -1 }
        if abs(leftHeight - rightHeight) > 1 { return -1 }
        return max(leftHeight, rightHeight) + 1
    }
}
