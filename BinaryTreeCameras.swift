// 968. Binary Tree Cameras
/**
Given a binary tree, we install cameras on the nodes of the tree. 

Each camera at a node can monitor its parent, itself, and its immediate children.

Calculate the minimum number of cameras needed to monitor all nodes of the tree.

 

Example 1:


Input: [0,0,null,0,0]
Output: 1
Explanation: One camera is enough to monitor all nodes if placed as shown.
Example 2:


Input: [0,0,null,0,null,0,null,null,0]
Output: 2
Explanation: At least two cameras are needed to monitor all nodes of the tree. The above image shows one of the valid configurations of camera placement.

Note:

The number of nodes in the given tree will be in the range [1, 1000].
Every node has value 0.
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
    var res = 0
    func minCameraCover(_ root: TreeNode?) -> Int {
        return (dfs(root) < 1 ? 1:0) + res
    }
    // if a node is 2, means it's nil,(no need take care)
    // if a node is 1, means it needs take care children and parent
    // if a node is 0, means it has parent take care
    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 2 }
        let left = dfs(node.left), right = dfs(node.right)
        if left == 0 || right == 0 {
            res += 1
            return 1
        }
        if left == 1 || right == 1 {
            return 2
        }
        return 0
    }
}