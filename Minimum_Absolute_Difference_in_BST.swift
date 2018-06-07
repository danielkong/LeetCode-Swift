// 530. Minimum Absolute Difference in BST
/**
Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.

Example:

    Input:

       1
        \
         3
        /
       2

    Output:
    1

Explanation:
    The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).

Note: There are at least two nodes in this BST.
*/

/**
    Idea: Inorder Tree Travese
*/


func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard let root = root else { return Int.max }
    
    var minDiff = Int.max, val = -1
    inorderTraversal(root, &val, &minDiff)
    
    return minDiff
}

func inorderTraversal(_ root: TreeNode, _ val: inout Int, _ minDiff: inout Int) {
    if let left = root.left {
        inorderTraversal(left, &val, &minDiff)
    }
    if val >= 0 {
        minDiff = min(minDiff, root.val - val)
    }
    val = root.val
    if let right = root.right {
        inorderTraversal(right, &val, &minDiff)
    }
}

/**

public class Solution {
    int min = Integer.MAX_VALUE;
    Integer prev = null;
    
    public int getMinimumDifference(TreeNode root) {
        if (root == null) return min;
        
        getMinimumDifference(root.left);
        
        if (prev != null) {
            min = Math.min(min, root.val - prev);
        }
        prev = root.val;
        
        getMinimumDifference(root.right);
        
        return min;
    }
    
}

*/