// Longest_Consecutive_Sequence.swift
/**
Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

For example,
Given [100, 4, 200, 1, 3, 2],
The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.

Your algorithm should run in O(n) complexity.
*/

    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums)
        var best = 0
        
        for i in set {
            if !set.contains(i-1) {
                var m = i + 1
                while set.contains(m) {
                    m += 1
                }
                best = max(best, m-i)
            }
        }
        return best   
    }
   
/**
 * Question Link: https://leetcode.com/problems/longest-consecutive-sequence/
 * Primary idea: Iterate the array and check all neighbor numbers with the help of set
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

class LongestConsecutiveSequence {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums)
        var longest = 0
        
        for num in nums {
            if set.contains(num) {
                set.remove(num)
                longest = max(1 + findConsecutive(&set, num, 1) + findConsecutive(&set, num, -1), longest)
            }
        }
        
        return longest
    }
    
    private func findConsecutive(_ set: inout Set<Int>, _ num: Int, _ step: Int) -> Int {
        var len = 0
        var num = num + step
    
        while set.contains(num) {
            set.remove(num)
            len += 1
            num += step
        }
        
        return len
    }
} 