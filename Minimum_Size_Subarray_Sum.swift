// 209 Minimum Size Subarray Sum
/**
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

For example, given the array [2,3,1,2,4,3] and s = 7,
the subarray [4,3] has the minimal length under the problem constraint.
*/

class Solution {
func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var i = 0, j = 0, sum = 0, minVal = Int.max
    
    while j < nums.count {
        sum += nums[j]
        j += 1
        while sum >= s {
            minVal = min(minVal, j-i)
            sum -= nums[i]
            i += 1
        }
    }
    return minVal == Int.max ? 0 : minVal
}
}