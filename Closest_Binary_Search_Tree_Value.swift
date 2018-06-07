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