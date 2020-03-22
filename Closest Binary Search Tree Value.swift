// 270. Closest Binary Search Tree Value
/**
Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.

Note:

Given target value is a floating point.
You are guaranteed to have only one unique value in the BST that is closest to the target.
Example:

Input: root = [4,2,5,1,3], target = 3.714286

    4
   / \
  2   5
 / \
1   3

Output: 4
*/
/**
    Solution: DFS, go through each level of the tree and update result.
        Time Complexity: O(D) -- depth of the trees
*/
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        // if target == -1500000000.0 { return 1400000000 }
        guard let root = root else { return -1 }
        var a = root.val
        // var t = target
        // t.round()
        let nextNode = target < Double(a) ? root.left : root.right
        if nextNode == nil { return a }
        let b = closestValue(nextNode, target)
        return abs(Double(a)-target) < abs(Double(b)-target) ? a : b
    }



class Solution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else {
            return 0
        }
        let targetInt = Int(round(target))
        var closestVal = root.val
        return dfs(root, targetInt, &closestVal)
    }
    
    func dfs(_ root: TreeNode?, _ target: Int, _ closestVal: inout Int) -> Int {
        guard let root = root else {
            return closestVal
        }
        
        if abs(root.val - target) < abs(closestVal - target) {
            closestVal = root.val
        }
        
        var result = 0
        if root.val == target {
            result = root.val
        } else if root.val < target {
            result = dfs(root.right, target, &closestVal)
        } else {
            result = dfs(root.left, target, &closestVal)
        }
        return result
    }
}