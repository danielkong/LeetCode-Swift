// 366. Find Leaves of Binary Tree
/**

Given a binary tree, collect a tree's nodes as if you were doing this: Collect and remove all leaves, repeat until the tree is empty.

Example:
Given binary tree 
          1
         / \
        2   3
       / \     
      4   5    
Returns [4, 5, 3], [2], [1].

Explanation:
1. Removing the leaves [4, 5, 3] would result in this tree:

          1
         / 
        2          
2. Now removing the leaf [2] would result in this tree:

          1          
3. Now removing the leaf [1] would result in the empty tree:

          []         
Returns [4, 5, 3], [2], [1].

*/

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

 // Solution Swift: Runtime: O(N) Space: O(N)
class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        helper(root, &res)
        return res
    }
    
    func helper(_ node: TreeNode?, _ res: inout [[Int]]) -> Int {
        if node == nil {
            return -1
        }
        var level = 1 + max(helper(node!.left, &res), helper(node!.right, &res))
        if res.count < level + 1 { res.append([Int]()) }
        res[level].append(node!.val)
        return level
    }
}

// Solution Java: 
/**
    public List<List<Integer>> findLeaves(TreeNode root) {
        List<List<Integer>> res = new ArrayList<>();
        height(root, res);
        return res;
    }
    private int height(TreeNode node, List<List<Integer>> res){
        if(null==node)  return -1;
        int level = 1 + Math.max(height(node.left, res), height(node.right, res));
        if(res.size()<level+1)  res.add(new ArrayList<>());
        res.get(level).add(node.val);
        return level;
    }
*/