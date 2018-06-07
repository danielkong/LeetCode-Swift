// 94. Binary Tree Inorder Traversal
/**
Given a binary tree, return the inorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,3,2]
Follow up: Recursive solution is trivial, could you do it iteratively?
*/
/**
	Idea: Stack and CurrentNode to update node then put into stack
*/

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode]()
        var cur = root
        
        while cur != nil || !stack.isEmpty {

            if cur != nil {
                stack.append(cur!)
                cur = cur!.left
            } else {
                cur = stack.removeLast()
                res.append(cur!.val)
                cur = cur!.right      
            }
          
        }
        return res
    }