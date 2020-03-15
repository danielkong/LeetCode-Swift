// 199. Binary Tree Right Side View
/**
Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Example:

Input: [1,2,3,null,5,null,4]
Output: [1, 3, 4]
Explanation:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---
*/
/**
	Solution: Tree Level Print, store the last val.
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
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [root]
        var nextLevel = [TreeNode]()
        var res = [Int]()
        while queue.count > 0 {
            let cur = queue.removeFirst()
            if cur.left != nil {
                nextLevel.append(cur.left!)
            }
            if cur.right != nil {
                nextLevel.append(cur.right!)
            }
            if queue.count == 0 {
                res.append(cur.val)
                queue = nextLevel
                nextLevel = []
            }
        }
        return res
    }
}