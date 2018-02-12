// 325. Maximum Size Subarray Sum Equals k


class Solution {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var maxCount = 0
        var sum = 0
        var sums = [Int: Int]()

        for i in 0..<nums.count {
            sum += nums[i]
            if sum == k {
                maxCount = i+1
            } else {
                let target = sum - k
                if let index = sums[target] {
                    maxCount = max(maxCount, i-index)
                }
            }
            if sums[sum] == nil {
                sums[sum] = i
            }
        }
        return maxCount
    }
}
/**
 nums = [1, -1, 5, -2, 3], k = 3, return 4
    sums[1] = 0
    sums[0] = 1
    sums[5] = 2
    sums[3] = 3 maxCount = 3+1
    sums[6] = 4
 nums = [-2, -1, 2, 1], k = 1, return 2
    sums[-2] = 0
    sums[-3] = 1
    sums[-1] = 2 since target = -1 - 1 = -2 and exists sums[-2] = 0, maxCount = max(0, 2-0)
    sums[]
 */
