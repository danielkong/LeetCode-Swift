// 137. Single Number II
/**
Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:

Input: [2,2,3,2]
Output: 3
Example 2:

Input: [0,1,0,1,0,1,99]
Output: 99
*/
/**
	Solution 1: HashMap
	Solution 2: Bitwise Operator
	Solution 3: Math -- trick
*/

    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        for num in nums {
            map[num, default:0] += 1
        }
        for key in map.keys {
            if map[key] == 1 {
                return key
            }
        }
        return -1
    }

    func singleNumber(_ nums: [Int]) -> Int {
        var seenOnce = 0, seenTwice = 0
        for num in nums {
            seenOnce = ~seenTwice & (seenOnce ^ num)
            seenTwice = ~seenOnce & (seenTwice ^ num)
        }
        
        return seenOnce
    }
    func singleNumber(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        let reducedSum = Set(nums).reduce(0, +)
        return (3 * reducedSum - sum) / 2
    }