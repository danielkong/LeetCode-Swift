// 136. Single Number
/**
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,1]
Output: 1
Example 2:

Input: [4,1,2,1,2]
Output: 4
*/    
/**
 Solution 1: Set/Hashmap

 Solution 2: Bitwise Operator
 


*/
    func singleNumber(_ nums: [Int]) -> Int {
        var map = Set<Int>()
        for num in nums {
            if map.contains(num) {
                map.remove(num)
            } else {
                map.insert(num)
            }
        }
        return map.first!
    }

    func singleNumber(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }

        var result = 0
        for i in 0..<nums.count {
            result ^= nums[i]
        }
        
        return result
    }