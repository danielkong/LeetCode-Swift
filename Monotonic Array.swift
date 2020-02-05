// 896. Monotonic Array     Easy
/**
An array is monotonic if it is either monotone increasing or monotone decreasing.

An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].

Return true if and only if the given array A is monotonic.

 

Example 1:

Input: [1,2,2,3]
Output: true
Example 2:

Input: [6,5,4,4]
Output: true
Example 3:

Input: [1,3,2]
Output: false
Example 4:

Input: [1,2,4,5]
Output: true
Example 5:

Input: [1,1,1]
Output: true
 

Note:

1 <= A.length <= 50000
-100000 <= A[i] <= 100000
*/
/**
    Solution 1: create two funcs, 1. is increasing, 2. is descreasing
    Solution 2: one for loop check both
*/

    func isMonotonic(_ A: [Int]) -> Bool {
        guard A.count > 1 else {
            return true
        }
        var isAscend = true
        var isDesascend = true
        for i in 0..<A.count-1 {
            if A[i] > A[i+1] {
                isAscend = false
            }
            if A[i] < A[i+1] {
                isDesascend = false
            }
        }
        return isAscend || isDesascend
    }