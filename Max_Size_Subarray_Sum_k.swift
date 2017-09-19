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
