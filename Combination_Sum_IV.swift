// 377. Combination Sum IV
/**
Given an integer array with all positive numbers and no duplicates, find the number of possible combinations that add up to a positive integer target.

Example:

nums = [1, 2, 3]
target = 4

The possible combination ways are:
(1, 1, 1, 1)
(1, 1, 2)
(1, 2, 1)
(1, 3)
(2, 1, 1)
(2, 2)
(3, 1)

Note that different sequences are counted as different combinations.

Therefore the output is 7.
Follow up:
What if negative numbers are allowed in the given array?
How does it change the problem?
What limitation we need to add to the question to allow negative numbers?
*/

/**
 * Question Link: https://leetcode.com/problems/combination-sum-iv/
 * Primary idea: DFS cannot solve without time limited error, so use DP
 * 
 * Note: Integer overflow
 * Space Complexity: O(n)
 *
 */

// Solution: 1. Recursion (DFS) -- Time Limit Exceeded, so DP
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        if target == 0 {
            return 1
        } 
        var res = 0
        for i in 0..<nums.count {
            if target >= nums[i] {
                res += combinationSum4(nums, target-nums[i])
            }
        }
        return res
    }

// Solution: 2. DP
class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = Array(repeating: 0, count: target+1)
        dp[0] = 1
        
        let nums = nums.sorted()
        for i in 1...target {
            for num in nums {
                if i < num {
                    break
                }
                // avoid dp[i] + dp[i-num] > Int.max. such as: [3,33], 1000
                if dp[i - num] > Int.max - dp[i] {
                    continue
                }
                if i - num >= 0 {
                    dp[i] += dp[i-num]
                }
            }
        }
        return dp[target]
    }
}
