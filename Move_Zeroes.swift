// 283. Move Zeroes
// Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
// For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
// Note:
//   You must do this in-place without making a copy of the array.
//   Minimize the total number of operations.
// Solution: 1. Naive. create new array without 0, for loop and add some 0. time O(n), space O(n)
//			 2. Two pointer. swap 0 and non-zero. time O(n), space O(1)

// Swifty way
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        let nonZeroNums = nums.filter { $0 != 0 }
        let zeroCount = nums.count - nonZeroNums.count
        nums = nonZeroNums + Array(repeating: 0, count: zeroCount)
    }
}
// Solution 2:
    func moveZeroes(_ nums: inout [Int]) {
        var zeroCount = 0
        for (index, num) in nums.enumerated() {
            if num == 0 {
                zeroCount+=1
            } else {
                nums[index - zeroCount] = num
            }
        }
        for i in nums.count - zeroCount..<nums.count {
            nums[i] = 0
        }
    }
