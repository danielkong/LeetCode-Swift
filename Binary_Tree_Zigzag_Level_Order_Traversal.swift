// 103. Binary Tree Zigzag Level Order Traversal
/**
Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its zigzag level order traversal as:
[
  [3],
  [20,9],
  [15,7]
]
*/

/**
	idea: Like tree level order, only one more rule is fromLeft or fromRight
	Runtime: O(N)
	Space: O(N)
*/

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        // similar to level order, one more is direction
        // 10.00 - 10.20
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [root]
        var nextLevel = [TreeNode]()
        var fromLeft = true
        var currTemp = [Int]()
        
        while !queue.isEmpty {
            var curr = queue.removeFirst()
            if let left = curr.left { nextLevel.append(left) }
            if let right = curr.right { nextLevel.append(right) }
            currTemp.append(curr.val)
            
            if queue.isEmpty {
                if fromLeft {
                    res.append(currTemp)
                } else {
                    var a = Array(currTemp.reversed())
                    res.append(a)
                }
                fromLeft = !fromLeft
                queue = nextLevel
                nextLevel = []
                currTemp = []
            }
        }
        return res
    }