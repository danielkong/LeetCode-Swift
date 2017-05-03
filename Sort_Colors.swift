// 75        Sort Colors        36.6%        Medium   Dutch National Flag     
/**
Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.

Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

Note:
You are not suppose to use the library's sort function for this problem.
*/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var idxred = 0, idxblue = nums.count-1, i = 0
        while i <= idxblue {
            if nums[i] == 0 {
                swap(idxred, i, &nums)
                idxred += 1
                i += 1
            } else if nums[i] == 1 {
                i += 1
            } else if nums[i] == 2 {
                swap(idxblue, i, &nums)
                idxblue -= 1
            }
        }
    }
    
    private func swap(_ idx: Int, _ i: Int, _ nums: inout [Int]) {
        // (nums[idx], nums[i]) = (nums[i], nums[idx])
        var temp = nums[idx]
        nums[idx] = nums[i]
        nums[i] = temp
    }
}
