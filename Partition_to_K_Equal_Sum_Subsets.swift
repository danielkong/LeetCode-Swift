// 698. Partition to K Equal Sum Subsets
/**
	Given an array of integers nums and a positive integer k, find whether it's possible to divide this array into k non-empty subsets whose sums are all equal.

Example 1:
	Input: nums = [4, 3, 2, 3, 5, 2, 1], k = 4
	Output: True
	Explanation: It's possible to divide it into 4 subsets (5), (1, 4), (2,3), (2,3) with equal sums.

Note:
	1. 1 <= k <= len(nums) <= 16.
	2. 0 < nums[i] < 10000.
*/

class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        
        let eachSum = sum/k
        let m = sum%k
        guard m == 0 else { return false }
        
        var visited = Array(repeating: 0, count: nums.count)
        return canPartition(nums, &visited, 0, k, 0, 0, eachSum)
    }
    
    func canPartition(_ nums: [Int], _ visited: inout [Int], _ start_idx: Int, _ k: Int, _ cur_sum: Int, _ cur_group_num_count: Int, _ target: Int) -> Bool {
        if k == 1 { return true }
        if cur_sum == target && cur_group_num_count > 0 {
            return canPartition(nums, &visited, 0, k-1, 0, 0, target)
        }    
        for i in start_idx ..< nums.count {
            if visited[i] == 0 {
                visited[i] = 1
                if canPartition(nums, &visited, i+1, k, cur_sum+nums[i], cur_group_num_count+1, target) {
                    return true
                }
                visited[i] = 0
            }
        }
        return false
    }
}