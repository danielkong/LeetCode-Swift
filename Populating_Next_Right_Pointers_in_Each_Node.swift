// 116. Populating Next Right Pointers in Each Node
/**
Given a binary tree

    struct TreeLinkNode {
      TreeLinkNode *left;
      TreeLinkNode *right;
      TreeLinkNode *next;
    }
Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

Note:

You may only use constant extra space.
You may assume that it is a perfect binary tree (ie, all leaves are at the same level, and every parent has two children).
For example,
Given the following perfect binary tree,
         1
       /  \
      2    3
     / \  / \
    4  5  6  7
After calling your function, the tree should look like:
         1 -> NULL
       /  \
      2 -> 3 -> NULL
     / \  / \
    4->5->6->7 -> NULL
*/

// Solution 1: Recursion java. Not prefect solution. The following II solution also could use here!

void connect(TreeLinkNode *root) {
    if (root == NULL) return;
    TreeLinkNode *pre = root;
    TreeLinkNode *cur = NULL;
    while(pre->left) {
        cur = pre;
        while(cur) {
            cur->left->next = cur->right;
            if(cur->next) cur->right->next = cur->next->left;
            cur = cur->next;
        }
        pre = pre->left;
    }
}

// Solution 2: 


// 117. Populating Next Right Pointers in Each Node II
/**
Follow up for problem "Populating Next Right Pointers in Each Node".

What if the given tree could be any binary tree? Would your previous solution still work?

Note:

You may only use constant extra space.
For example,
Given the following binary tree,
         1
       /  \
      2    3
     / \    \
    4   5    7
After calling your function, the tree should look like:
         1 -> NULL
       /  \
      2 -> 3 -> NULL
     / \    \
    4-> 5 -> 7 -> NULL

*/
// Solution: Java. Two pointer. Runtime O(n) Space O(1)
/**
 * Definition for binary tree with next pointer.
 * public class TreeLinkNode {
 *     int val;
 *     TreeLinkNode left, right, next;
 *     TreeLinkNode(int x) { val = x; }
 * }
 */
public class Solution {
    public void connect(TreeLinkNode root) {
        if (root == null) {
            return;
        }
        
        TreeLinkNode dummy = new TreeLinkNode(0);
        TreeLinkNode curr = dummy;
        while (root != null) {
            if (root.left != null) { curr.next = root.left; curr = curr.next; }
            if (root.right != null) { curr.next = root.right; curr = curr.next; }
            root = root.next;
            
            if (root == null) {
                curr = dummy;
                root = dummy.next;
                dummy.next = null;
            }
        }
    }
}

// Solution: Swift. Same as Java
class TreeLinkNode: NSObject {
    var val: Int = 0
    let left: TreeLinkNode?
    let right: TreeLinkNode?
    var next: TreeLinkNode?
    
    init(_ value:Int, _ left: TreeLinkNode? = nil, _ right: TreeLinkNode? = nil, _ next: TreeLinkNode? = nil) {
        self.val = value
        self.left = left
        self.right = right
        self.next = next
    }
}

public func connect(_ root: TreeLinkNode) {
    var root: TreeLinkNode? = root
    guard root != nil else {
        return
    }
    
    let dummy = TreeLinkNode(0)
    var curr = dummy
    while root != nil {
        if let left = root?.left {
            curr.next = left
            curr = curr.next!
        }
        if let right = root?.right {
            curr.next = right
            curr = curr.next!
        }
        root = root?.next
    }
    
    if root == nil {
        curr = dummy
        root = dummy.next
        dummy.next = nil
    }
}