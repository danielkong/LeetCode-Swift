// 560. Subarray Sum Equals K
/**
	Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

	Example 1:
	Input:nums = [1,1,1], k = 2
	Output: 2
	Note:
	The length of the array is in range [1, 20,000].
	The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
*/
/**
	Solution: Find all possible solution.
	Time complexity : O(n^2) We need to consider every subarray possible.
	Space complexity: O(1). Constant space is used.
*/
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count {
                sum += nums[j]
                if sum == k {
                    res += 1
                }
            }
        }
        return res
    }
/**
	Solution 2: hashmap
	Time complexity : O(n) 
	Space complexity: O(n)

*/
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var map = [Int:Int]()
        map[0] = 1
        var count = 0
        var runningSum  = 0
        for i in 0..<nums.count {
            runningSum += nums[i]
            if (map[runningSum - k] != nil) {
                count += map[runningSum - k]!
            }
            
            if (map[runningSum] == nil){
                map[runningSum] = 1
            }
            else {
                map[runningSum] = map[runningSum]! + 1
            }
        }
        
        return count
    }