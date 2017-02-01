// 102 Binary Tree Level Order Traversal   36.9%        Easy        
/** 
Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:
[
  [3],
  [9,20],
  [15,7]
]
*/

/**
 * Definition for a binary tree node.
 * Primary idea: use a queue to help hold TreeNode, and for each level add a new Int array
 * Time Complexity: O(n), Space Complexity: O(n)
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()

        guard let root = root else {
            return res
        }
        var currLevelNodes: [TreeNode] = [root]
        var currLevelArr = [Int]()
        var nextLevelNodes: [TreeNode] = []
        
        while !currLevelNodes.isEmpty {
            var firstNode = currLevelNodes.first 
            if let firstNode = firstNode {
                currLevelArr.append(firstNode.val)
                if firstNode.left != nil {
                    nextLevelNodes.append(firstNode.left!)  
                }
                if firstNode.right != nil {
                    nextLevelNodes.append(firstNode.right!)
                }
                currLevelNodes.removeFirst()
            
                if currLevelNodes.isEmpty && !nextLevelNodes.isEmpty {
                    res.append(currLevelArr)
                    currLevelArr.removeAll()
                    currLevelNodes = nextLevelNodes
                    nextLevelNodes.removeAll()
                } else if currLevelNodes.isEmpty && nextLevelNodes.isEmpty {
                    if currLevelArr.count > 0 {
                        res.append(currLevelArr)
                    } 
                }
            }

        }
        return res
    }
}