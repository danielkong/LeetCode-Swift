// 349. Intersection of Two Arrays
/**
Given two arrays, write a function to compute their intersection.

Example:
Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].

Note:
Each element in the result must be unique.
The result can be in any order.
*/

/*
 Runtime: O(m + n)
 Space: O(m)
*/
class Solution {

    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var s = Set<Int>()
        
        for num in nums1 {
            s.insert(num)
        }
        
        var res = [Int]()
        
        for num in nums2 {
            if s.contains(num) {
                res.append(num)
                s.remove(num)
            }
        }
        
        return res
    }
}