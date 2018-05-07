// 152. Maximum Product Subarray
/**
Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

Example 1:
	Input: [2,3,-2,4]
	Output: 6
	Explanation: [2,3] has the largest product 6.

Example 2:
	Input: [-2,0,-1]
	Output: 0
	Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
*/
/**
	Idea: 	for loop, update tempMaxProd, when hits 0, reset prod.
			window shrinking == taking product from right to left
	Runtime:
	Space: 
*/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var prod = 0
        var maxProd = Int.min
        for num in nums {
            if prod == 0 {
                prod = num
            } else {
                prod *= num
            }
            maxProd = max(prod, maxProd)
        }
        // If 0 in middle, like [3,-1,4] or [2,-5,-2,-4,3]
        prod = 0
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            if prod == 0 {
                prod = nums[i]
            } else {
                prod *= nums[i]
            }
            maxProd = max(prod, maxProd)            
        }
        
        return maxProd
    }
}