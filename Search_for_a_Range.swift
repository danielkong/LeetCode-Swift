// 34. Search for a Range
/**
Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

*/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // linear
        // binary search O(logN)
        var res: [Int] = [-1, -1]
        guard nums.count > 0 && nums[nums.count-1] >= target else { return res }
        var i = 0
        var j = nums.count
        while i <= j {
            let mid = i + (j-i)/2
            if nums[mid] == target {
                res[0] = mid
                res[1] = mid
                i = mid
                j = mid
                while nums[i] == nums[mid] && i >= 0 {
                    res[0] = i
                    i -= 1
                    if i < 0 { break }
                }
                while nums[j] == nums[mid] && j < nums.count {
                    res[1] = j
                    j += 1
                    if j >= nums.count { break }
                }
                return res
            } else if nums[mid] < target {
                i = mid + 1
            } else {
                j = mid - 1
            }
        }
        return res
    }
}