//	337. House Robber III
/**
The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

Determine the maximum amount of money the thief can rob tonight without alerting the police.
*/
// Solution: Runtime O(N), Space: O(2N)

class Solution {
    func rob(_ root: TreeNode?) -> Int {
        var sums = Array(repeating: 0, count: 2)
        sums = helper(root, sums, 0)
        return max(sums[1], sums[0])
    }
    
    func helper(_ node: TreeNode?, _ sums: [Int], _ level: Int) -> [Int] {
        guard let node = node else { return [0, 0] }

        let left = helper(node.left, sums, level+1)
        let right = helper(node.right, sums, level+1)
        var res = Array(repeating: 0, count: 2)
        res[0] = max(left[0], left[1]) + max(right[0], right[1])
        res[1] = node.val + left[0] + right[0]
        return res
    }
}