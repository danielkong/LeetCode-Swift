// 653. Two Sum IV - Input as BST.
/*
Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

Example 1:
Input:
    5
   / \
  3   6
 / \   \
2   4   7

Target = 9

Output: True
Example 2:
Input:
    5
   / \
  3   6
 / \   \
2   4   7

Target = 28

Output: False
*/
/*

Time Complexity: O(n), Space Complexity: O(n).
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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {

    }
}


// Java Method 1. Hashset
// This method also works for those who are not BSTs. The idea is to use a hashtable to save the values of the nodes in the BST. Each time when we insert the value of a new node into the hashtable, we check if the hashtable contains k - node->val.
// Time Complexity: O(n), Space Complexity: O(n).

public boolean findTarget(TreeNode root, int k) {
	HashSet<Integer> set = new HashSet<>();
	return dfs(root, set, k);
}

public boolean dfs(TreeNode root, HashSet<Integer> set, int k){
	if(root == null)return false;
	if(set.contains(k - root.val))return true;
	set.add(root.val);
	return dfs(root.left, set, k) || dfs(root.right, set, k);
}
// Java Method 2. Inorder tree traversal
// The idea is to use a sorted array to save the values of the nodes in the BST by using an inorder traversal. Then, we use two pointers which begins from the start and end of the array to find if there is a sum k.
// Time Complexity: O(n), Space Complexity: O(n)
public boolean findTarget(TreeNode root, int k) {
	List<Integer> nums = new ArrayList<>();
	inorder(root, nums);
	for(int i = 0, j = nums.size()-1; i<j;){
		if(nums.get(i) + nums.get(j) == k)return true;
		if(nums.get(i) + nums.get(j) < k)i++;
		else j--;
	}
	return false;
}

public void inorder(TreeNode root, List<Integer> nums){
	if(root == null)return;
	inorder(root.left, nums);
	nums.add(root.val);
	inorder(root.right, nums);
}
// Java. Method 3.
// The idea is to use binary search method. For each node, we check if k - node->val exists in this BST.
// Time Complexity: O(nlogn), Space Complexity: O(h). h is the height of the tree, which is logn at best case, and n at worst case
public boolean findTarget(TreeNode root, int k) {
        return dfs(root, root,  k);
    }

    public boolean dfs(TreeNode root,  TreeNode cur, int k){
        if(cur == null)return false;
        return search(root, cur, k - cur.val) || dfs(root, cur.left, k) || dfs(root, cur.right, k);
    }

    public boolean search(TreeNode root, TreeNode cur, int value){
        if(root == null)return false;
        return (root.val == value) && (root != cur)
            || (root.val < value) && search(root.right, cur, value)
                || (root.val > value) && search(root.left, cur, value);
    }
}
