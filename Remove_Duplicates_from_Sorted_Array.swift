// 26      |  Remove Duplicates from Sorted Array  |35.3%|Easy|   
/**
Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this in place with constant memory.

For example,
Given input array nums = [1,1,2],

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
*/     
/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 * Primary idea: keep a index, compare the element at that index with the element moving forward
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var lastItemIdx = 0
        var i = 1
        while i < nums.count {
            if nums[i] == nums[lastItemIdx] {
                i += 1
            } else {
                lastItemIdx += 1 
                nums[lastItemIdx] = nums[i]
            }
        }
        return lastItemIdx + 1
    }

    func removeDuplicates(inout nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
    
        var lastIndex = 0
        
        for num in nums {
            if num != nums[lastIndex] {
                lastIndex += 1
                nums[lastIndex] = num
            }
        }
        
        return lastIndex + 1
    }
