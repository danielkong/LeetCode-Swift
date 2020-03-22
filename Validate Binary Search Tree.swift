// 98        Validate Binary Search Tree        22.3%        Medium   
/**
Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.
Example 1:
    2
   / \
  1   3
Binary tree [2,1,3], return true.
Example 2:
    1
   / \
  2   3
Binary tree [1,2,3], return false.
*/

// Solution: 1. Recursion
/**
    Recursion, root case node nil -> true

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        // recursion
        guard let node = root else {
            return true
        }
        
        return helper(node, Int.min, Int.max)
    }
    
    func helper(_ node: TreeNode?, _ lower: Int, _ upper: Int) -> Bool {
        guard let node = node else { return true }
        
        if lower != Int.min && node.val <= lower { return false }
        if upper != Int.max && node.val >= upper { return false }
        return helper(node.right, node.val, upper) && helper(node.left, lower, node.val)
    }
}

// Solution: 2. Iteration -- using  Queue (Java)

public boolean isValidBST (TreeNode root){
   Stack<TreeNode> stack = new Stack<TreeNode> ();
   TreeNode cur = root ;
   TreeNode pre = null ;           
   while (!stack.isEmpty() || cur != null) {               
       if (cur != null) {
           stack.push(cur);
           cur = cur.left ;
       } else {                
           TreeNode p = stack.pop() ;
           if (pre != null && p.val <= pre.val) {                      
               return false ;
           }                   
           pre = p ;                       
           cur = p.right ;
       }
   }
   return true ; 
}

       
public class Solution {
    public boolean isValidBST(TreeNode root) {
        if(root == null)
            return true;
 
        LinkedList<BNode> queue = new LinkedList<BNode>();
        queue.add(new BNode(root, Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY));
        while(!queue.isEmpty()){
            BNode b = queue.poll();
            if(b.n.val <= b.left || b.n.val >=b.right){
                return false;
            }
            if(b.n.left!=null){
                queue.offer(new BNode(b.n.left, b.left, b.n.val));
            }
            if(b.n.right!=null){
                queue.offer(new BNode(b.n.right, b.n.val, b.right));
            }
        }
        return true;
    }
}
//define a BNode class with TreeNode and it's boundaries
class BNode{
    TreeNode n;
    double left;
    double right;
    public BNode(TreeNode n, double left, double right){
        this.n = n;
        this.left = left;
        this.right = right;
    }
}