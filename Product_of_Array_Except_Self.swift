// 238. Product of Array Except Self
/**
Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Solve it without division and in O(n).

For example, given [1,2,3,4], return [24,12,8,6].

Follow up:
Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
*/

/**
 * Primary idea: Use two arrays to hold multiplication result from left and right sides
 *               while iterating the original array
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return [0]
        }
        var res = Array(repeating: 1, count: nums.count)

        for i in 1..<nums.count {
            res[i] = res[i-1] * nums[i-1]
        }
        var right = 1
        for index in stride(from: nums.count-1, through: 0, by: -1) {
            res[index] *= right
            right *= nums[index]
        } 
        return res
    }
}
