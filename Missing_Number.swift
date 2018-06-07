// 268. Missing Number
/**
Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

Example 1:

Input: [3,0,1]
Output: 2
Example 2:

Input: [9,6,4,2,3,5,7,0,1]
Output: 8
Note:
Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
*/


/**
	XOR
	Sum
*/

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var res = nums.count
        for i in 0..<nums.count {
            res ^= i
            res ^= nums[i]
        }
        return res
    }
}
//
public int missingNumber(int[] nums) { //sum
    int len = nums.length;
    int sum = (0+len)*(len+1)/2;
    for(int i=0; i<len; i++)
        sum-=nums[i];
    return sum;
}