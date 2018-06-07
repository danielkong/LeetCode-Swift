// 658. Find K Closest Elements
/**
Given a sorted array, two integers k and x, find the k closest elements to x in the array. The result should also be sorted in ascending order. If there is a tie, the smaller elements are always preferred.

Example 1:
    Input: [1,2,3,4,5], k=4, x=3
    Output: [1,2,3,4]

Example 2:
    Input: [1,2,3,4,5], k=4, x=-1
    Output: [1,2,3,4]

Note:
    The value k is positive and will always be smaller than the length of the sorted array.
    Length of the given array is positive and will not exceed 10^4
    Absolute value of elements in the array and x will not exceed 10^4
*/
/**
    Idea: since sorted array, binary search, left as 0, right as n-k
    Runtime: O(logN)
    Space O(k)
*/

    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count-k
        // BS lgN        
        while left < right {
            let mid = (right - left)/2 + left
            if x-arr[mid] > arr[mid+k]-x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        print(left)
        return Array(arr[left..<left+k])
    }