// 543. Diameter of Binary Tree
// Binary Tree longest Path
// Version 1:
// http://www.geeksforgeeks.org/diameter-of-a-binary-tree/
// Solution Java: Time O(n^2)
public class Solution {
    int diameter(Node root)
    {
        /* base case if tree is empty */
        if (root == null)
            return 0;
 
        /* get the height of left and right sub trees */
        int lheight = height(root.left);
        int rheight = height(root.right);
 
        /* get the diameter of left and right subtrees */
        int ldiameter = diameter(root.left);
        int rdiameter = diameter(root.right);
 
        /* Return max of following three
          1) Diameter of left subtree
         2) Diameter of right subtree
         3) Height of left subtree + height of right subtree + 1 */
        return Math.max(lheight + rheight + 1,
                        Math.max(ldiameter, rdiameter));
 
    }
    int height(Node node)
    {
        /* base case tree is empty */
        if (node == null)
            return 0;
 
        /* If tree is not empty then height = 1 + max of left
           height and right heights */
        return (1 + Math.max(height(node.left), height(node.right)));
    }
}

// Version 2: 
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

// Soltuion Swift 2: 58 ms

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
    var maxDiameter = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }

        maxDepth(root)
        return maxDiameter
    }
    
    private func maxDepth(_ node: TreeNode?) -> Int {
        guard node != nil else {
            return 0
        }
        let left = maxDepth(node!.left)
        let right = maxDepth(node!.right)
        
        maxDiameter = max(maxDiameter, left + right)
        return max(left, right) + 1
    }
}

// Solution Swift: Time: O(n^2) 553 ms
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    if root!.left == nil && root!.right == nil {
        return 0
    }
    
    let left_height = height(root!.left)
    let right_height = height(root!.right)
    var sum_height = 0
    if root!.left != nil && root!.right != nil {
        sum_height = left_height + right_height + 2
    } else {
        sum_height = root!.left != nil ? left_height+1 : right_height+1
    }
    
    let left_diameter = diameterOfBinaryTree(root!.left)
    let right_diameter = diameterOfBinaryTree(root!.right)
    
    return max(sum_height, max(left_diameter, right_diameter))
}

private func height(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    } else {
        if  (node!.left == nil && node!.right == nil) {
            return 0
        }
    }
    return 1 + max(height(node!.left), height(node!.right))
}

// Soltuion Java:
public class Solution {
    int max = 0;
    
    public int diameterOfBinaryTree(TreeNode root) {
        maxDepth(root);
        return max;
    }
    
    private int maxDepth(TreeNode root) {
        if (root == null) return 0;
    
        int left = maxDepth(root.left);
        int right = maxDepth(root.right);
    
        max = Math.max(max, left + right);
    
        return Math.max(left, right) + 1;
    }
}
