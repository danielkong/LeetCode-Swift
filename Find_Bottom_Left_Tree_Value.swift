// 513. Find Bottom Left Tree Value
/**
Given a binary tree, find the leftmost value in the last row of the tree.

Example 1:
Input:

    2
   / \
  1   3

Output:
1
Example 2: 
Input:

        1
       / \
      2   3
     /   / \
    4   5   6
       /
      7

Output:
7
Note: You may assume the tree (i.e., the given root node) is not NULL.
*/

// Solution 1: BFS Time O(logN), Space O(N), Like Level-order Tree.
// But Smart solution we could do, is adding root.right first, then adding root.left with one queue. The last item is result

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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var currentLevel = [TreeNode]()
        var nextLevel = [TreeNode]()
        var nextFirstNodeVal = root!.val
        
        currentLevel.append(root!)
        
        while currentLevel.count > 0 {
            var currNode = currentLevel.removeFirst()
            if let left = currNode.left {
                nextLevel.append(left)
            }
            if let right = currNode.right {
                nextLevel.append(right)
            }
            if currentLevel.count == 0 {
                currentLevel = nextLevel
                if nextLevel.count > 0 { nextFirstNodeVal = nextLevel[0].val }
                nextLevel = []
            }
        }
        return nextFirstNodeVal
    }
}

// Solution 2 Java: DFS helper(TreeNode, depth)

public class Solution {
    int ans=0, h=0;
    public int findBottomLeftValue(TreeNode root) {
        findBottomLeftValue(root, 1);
        return ans;
    }
    public void findBottomLeftValue(TreeNode root, int depth) {
        if (h<depth) {ans=root.val;h=depth;}
        if (root.left!=null) findBottomLeftValue(root.left, depth+1);
        if (root.right!=null) findBottomLeftValue(root.right, depth+1);
    }
}
// No global variables, 6ms (faster):

public class Solution {
    public int findBottomLeftValue(TreeNode root) {
        return findBottomLeftValue(root, 1, new int[]{0,0});
    }
    public int findBottomLeftValue(TreeNode root, int depth, int[] res) {
        if (res[1]<depth) {res[0]=root.val;res[1]=depth;}
        if (root.left!=null) findBottomLeftValue(root.left, depth+1, res);
        if (root.right!=null) findBottomLeftValue(root.right, depth+1, res);
        return res[0];
    }
}
