// 285        Inorder Successor in BST         36.2%        Medium        
// Given a binary search tree and a node in it, find the in-order successor of that node in the BST.
// Note: If the given node has no in-order successor in the tree, return null.

func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    if root.val <= p.val {
        return inorderSuccessor(root.right, p)
    } else {
        let temp: TreeNode? = inorderSuccessor(root.left, p)
        return temp != nil ? temp : root
    }
}

func predecessor(_ root: TreeNode?, _ p: TreeNode) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    if root.val >= p.val {
        return predecessor(root.left, p)
    } else {
        let temp: TreeNode? = predecessor(root.right, p)
        return temp != nil ? temp : root
    }
}

// Solution: Java. time O(log(n)) and space is O(1).

public TreeNode inorderSuccessor(TreeNode root, TreeNode p) {
    if(root==null)
        return null;
 
    TreeNode next = null;
    TreeNode c = root;
    while(c!=null && c.val!=p.val){
        if(c.val > p.val){
            next = c;
            c = c.left;
        }else{
            c= c.right;
        }
    }
 
    if(c==null)        
        return null;
 
    if(c.right==null)
        return next;
 
    c = c.right;
    while(c.left!=null)
        c = c.left;
 
    return c;
}

// Solution Java: Iterative
    TreeNode* inorderSuccessor(TreeNode* root, TreeNode* p) {
        TreeNode *res = NULL;
        while (root) {
            if (root->val > p->val) {
                res = root;
                root = root->left;
            } else root = root->right;
        }
        return res;
    }