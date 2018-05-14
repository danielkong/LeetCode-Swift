// 523	Continuous Subarray Sum   		21.6%	Medium
/**
Given a list of non-negative numbers and a target integer k, write a function to check if the array has a continuous subarray of size at least 2 that sums up to the multiple of k, that is, sums up to n*k where n is also an integer.

Example 1:
Input: [23, 2, 4, 6, 7],  k=6
Output: True
Explanation: Because [2, 4] is a continuous subarray of size 2 and sums up to 6.
Example 2:
Input: [23, 2, 6, 4, 7],  k=6
Output: True
Explanation: Because [23, 2, 6, 4, 7] is an continuous subarray of size 5 and sums up to 42.

Note:
The length of the array won't exceed 10,000.
You may assume the sum of all the numbers is in the range of a signed 32-bit integer.

*/
/**
 Idea:  1. Naive solution.
            Two for loop, check accumulated sum % k == 0, for case k=0, use sum == k check
 Runtime: O(N^2)
 Space: O(1)
        2. Enhanced solution
            If a%k = m, b%k=m, then a-b%k=0, So, [23, 2, 4, ...] k = 6,
 Runtime: O(N)
 Space: O(N)
 
 */

// Solution Swift 1:

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    for i in 0..<(nums.count - 1) {
        var sum = nums[i]
        for j in (i + 1)..<nums.count {
            sum += nums[j]
            if k != 0 && sum % k == 0 || sum == 0 {
                return true
            }
        }
    }
    return false
}

// Solution Swift 2: Using HashMap

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    for i in 0..<(nums.count - 1) {
        var sum = nums[i]
        for j in (i + 1)..<nums.count {
            sum += nums[j]
            if k != 0 && sum % k == 0 || sum == 0 {
                return true
            }
        }
    }
    return false
}
