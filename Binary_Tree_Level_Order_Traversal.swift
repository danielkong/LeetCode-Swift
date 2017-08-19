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
Primary Idea: 1. BFS iteration.
              2. Recursion Following:
Runtime: O(n), Space: O(n)
*/
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var res: [[Int]] = []
        var currentLevel: [TreeNode] = []
        var nextLevel: [TreeNode] = []

        currentLevel.append(root)

        var temp: [Int] = []

        while currentLevel.count > 0 {
            var item = currentLevel.removeFirst()
            temp.append(item.val)
            if let left = item.left {
                nextLevel.append(left)
            }
            if let right = item.right {
                nextLevel.append(right)
            }
            if currentLevel.count == 0 {
                res.append(temp)
                currentLevel = nextLevel
                nextLevel = []
                temp = []
            }
        }
        return res
    }
}
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

// 2. recursion
public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        levelHelper(res, root, 0);
        return res;
    }

    public void levelHelper(List<List<Integer>> res, TreeNode root, int height) {
        if (root == null) return;
        if (height >= res.size()) {
            res.add(new LinkedList<Integer>());
        }
        res.get(height).add(root.val);
        levelHelper(res, root.left, height+1);
        levelHelper(res, root.right, height+1);
    }
}
