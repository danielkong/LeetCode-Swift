// 34. Find First and Last Position of Element in Sorted Array
/**
Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

 

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
Example 3:

Input: nums = [], target = 0
Output: [-1,-1]
 

Constraints:

0 <= nums.length <= 10^5
-10^9 <= nums[i] <= 10^9
nums is a non-decreasing array.
-10^9 <= target <= 10^9
*/
/**
 Solution: Use Binary Search, check left and right position twice.
 Runtime: O(logN)
 Space: O(1)
*/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [-1, -1]
        guard nums.count > 0 else { return res }
        if target < nums[0] { return res }
        var left = 0
        var right = nums.count - 1 
        if target > nums[right] { return res }
        if nums.count == 1 && nums[0] == target {
            return [0, 0]
        }
        
        // find first time
        var firstPosition = -1
        while left <= right {
            var mid = (right - left)/2 + left
            if target < nums[mid] {
                right = mid - 1
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                if mid == 0 {
                    firstPosition = 0
                } else {
                    while (nums[mid] == target && mid > 0) {
                        mid -= 1
                    }
                    firstPosition = mid == 0 && nums[mid] == target ? 0 : mid+1
                }                
                break
            }
        }

        left = 0
        right = nums.count - 1 
        // find last position
        var lastPosition = -1
        while left <= right {
            var mid = (right - left)/2 + left
            if target < nums[mid] {
                right = mid - 1
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                if mid == nums.count - 1 {
                    lastPosition = mid
                } else {
                    while (mid < nums.count && nums[mid] == target) {
                      mid += 1
                   }
                   lastPosition = mid-1
                }                
                break
            }
        }

        return [firstPosition, lastPosition]
    }
}
