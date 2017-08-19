// 42. Trapping Rain Water
/*
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

For example,
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
*/
/**
 * Question Link: https://leetcode.com/problems/trapping-rain-water/
 * Naive idea: 1. left array store left Maximum left value at that index (from 0 to len)
 			   2. right array store right maximum right value at that index (from len to 0)
			   3. water array min(left[i], right[i]) - height[i] > 0 ? min(left[i], right[i]) - height[i] : 0
			   4. sum water array is the result
* Time Complexity: O(n), Space Complexity: O(n)

 * Primary idea: max_left, max_right update dynamic.
 * Time Complexity: O(n), Space Complexity: O(1)
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }

        var i = 0, j = height.count - 1
        var max_left = 0, max_right = 0
        var res = 0
        while i < j {
            if height[i] < height[j] {
                max_left = max(max_left, height[i])

                res += max_left - height[i]
                i += 1
            } else {
                max_right = max(max_right, height[j])
                res += max_right - height[j]
                j -= 1
            }
        }
        return res
    }
}
