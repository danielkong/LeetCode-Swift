// 515. Find Largest Value in Each Tree Row

/**

You need to find the largest value in each row of a binary tree.

Example:
Input: 

          1
         / \
        3   2
       / \   \  
      5   3   9 

Output: [1, 3, 9]

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

/**
    Idea:   BFS -- Level by level, compare all values in each value, update res 
            DFS -- if res does not exist append to res, if res exist, compare
    Runtime: O(N)
    Space : O(logN)
 */

// Solution Swift 1 BFS

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        // BFS, level compare and update
        var queue = [root]
        var currentLevelMax = Int.min
        var nextLevelNodes = [TreeNode]()
        var res = [Int]()
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            currentLevelMax = max(currentLevelMax, node.val)
            if let left = node.left { nextLevelNodes.append(left) }
            if let right = node.right { nextLevelNodes.append(right) }
            if queue.isEmpty {
                res.append(currentLevelMax)
                currentLevelMax = Int.min
                queue = nextLevelNodes
                nextLevelNodes.removeAll()
            }
        }
        return res
    }
}

// Solution Swift 2 DFS

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var rst = [Int]()
        dfs(&rst, root, 0)
        return rst
    }
    
    private func dfs(_ rst: inout [Int], _ root: TreeNode?, _ level: Int) {
        if root == nil {
            return
        }
        if rst.count <= level {
            rst.append(root!.val)
        } else {
            let old = rst[level]
            rst[level] = max(old, root!.val)
        }
        dfs(&rst, root!.left, level+1)
        dfs(&rst, root!.right, level+1)
    }
}