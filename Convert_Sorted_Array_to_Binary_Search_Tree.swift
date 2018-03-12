// 108. Convert Sorted Array to Binary Search Tree
/**
Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.


Example:

Given the sorted array: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 { return nil }
        return sortedArrayToBST(nums, 0, nums.count - 1)
    }
    func sortedArrayToBST(_ nums: [Int], _ start: Int, _ end: Int)  -> TreeNode? {
        if start > end { return nil }
        let mid = (end - start)/2 + start
        let root = TreeNode(nums[mid])
        root.left = sortedArrayToBST(nums, start, mid - 1)
        root.right = sortedArrayToBST(nums, mid + 1, end)
        
        return root
    }
}