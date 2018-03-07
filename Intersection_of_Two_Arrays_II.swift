// 350. Intersection of Two Arrays II
/**
Given two arrays, write a function to compute their intersection.

Example:
Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].

Note:
Each element in the result should appear as many times as it shows in both arrays.
The result can be in any order.
Follow up:
What if the given array is already sorted? How would you optimize your algorithm?
What if nums1's size is small compared to nums2's size? Which algorithm is better?
What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
*/

// Time O(n+m)
// Space O(n)
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for num in nums1 {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                dict[num]! += 1
            }
        }
        
        var res = [Int]()
        for num in nums2 {
            if dict[num] == nil {
                
            } else if dict[num]! > 0 {
                dict[num]! -= 1
                res.append(num)
            }
        }
        return res
    }
}