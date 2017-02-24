// 334 Increasing Triplet Subsequence
/**
Given an unsorted array return whether an increasing subsequence of length 3 exists or not in the array.

Formally the function should:
Return true if there exists i, j, k 
such that arr[i] < arr[j] < arr[k] given 0 ≤ i < j < k ≤ n-1 else return false.
Your algorithm should run in O(n) time complexity and O(1) space complexity.

Examples:
Given [1, 2, 3, 4, 5],
return true.

Given [5, 4, 3, 2, 1],
return false.
*/

    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else {
            return false
        }
        
        var c1 = Int.max // c1
        var c2 = Int.max // c2
        for num in nums {
            if num <= c1 {
                c1 = num
            } else if num <= c2 {
                c2 = num
            } else {
                return true
            }
        }
        return false
    }