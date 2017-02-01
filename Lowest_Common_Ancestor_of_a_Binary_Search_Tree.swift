// 235    Lowest Common Ancestor of a Binary Search Tree       38.1%        Easy        


// Solution: Iterative. Space O(1) Time O(logN)
func lowestCommonAncestor(_ root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode {
	while (root.val - p.val) * (root.val - q.val) > 0 {
		root = p.val < root.val ? root.left : root.right
	}
	return root
}

// Solution: Recursion.
func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
	if (root.val - p.val) * (root.val - q.val) >= 0 {
		return root
	} else {
		lowestCommonAncestor((root.val - p.val) > 0 ? root.left : root.right, p, q)
	}
}