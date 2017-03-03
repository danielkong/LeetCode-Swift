// 80. Remove Duplicates from Sorted Array II
/**
Follow up for "Remove Duplicates":
What if duplicates are allowed at most twice?

For example,
Given sorted array nums = [1,1,1,2,2,3],

Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.

*/
// Solution: 1. Space O(1), Time: O(n) . num compare with num[i-2]
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for num in nums {
            if i < 2 || num > nums[i-2] {
                nums[i] = num
                i += 1
            }
        }
        return i
    }
}