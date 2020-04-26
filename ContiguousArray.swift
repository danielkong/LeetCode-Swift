// 525. Contiguous Array
/**
Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

Example 1:
Input: [0,1]
Output: 2
Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
Example 2:
Input: [0,1,0]
Output: 2
Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
Note: The length of the given binary array will not exceed 50,000.
*/
/**
 Explain: Output is continous subarry has 1 and 0 equal count.
 Solution: HashMap
 Runtime: O(N)
 Space: O(N)
*/
    func findMaxLength(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var dict = [Int: Int]()
        dict[0] = -1
        var maxLen = 0, count = 0
        for i in 0..<nums.count {
            count += nums[i]==1 ? 1 : -1
            if let temp = dict[count] {
                maxLen = max(maxLen, i - temp)
            } else {
                dict[count] = i
            }
        }
        return maxLen
    }