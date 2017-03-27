//  173        Binary Search Tree Iterator (Inorder)       38.9%        Medium
/**
Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

Calling next() will return the next smallest number in the BST. Inorder

Note: next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
 //          8
 //        /   \
 //       3     10
 //      / \      \
 //     1   6     14
 //        / \    /
 //       4   7  13
 // inorder: // [1, 3, 4, 6, 7, 8, 10, 13, 14]
 // preorder:   [8, 3, 1, 6, 4, 7, 10, 14, 13]
 // postorder:  [1, 4, 7, 6, 3, 13, 14, 10, 8]
 
https://en.wikipedia.org/wiki/Tree_traversal#In-order
*/

// Solution 1: Java
/**
public class BSTIterator {
    private Stack<TreeNode> stack = new Stack<TreeNode>();
    
    public BSTIterator(TreeNode root) {
        pushAll(root);
    }

    /** @return whether we have a next smallest number */
    public boolean hasNext() {
        return !stack.isEmpty();
    }

    /** @return the next smallest number */
    public int next() {
        TreeNode tmpNode = stack.pop();
        pushAll(tmpNode.right);
        return tmpNode.val;
    }
    
    private void pushAll(TreeNode node) {
        for (; node != null; stack.push(node), node = node.left);
    }
}
 */

// Solution 2: Swift - iterator with stack - inorder


class TreeNode: NSObject {
    var left: TreeNode? = nil
    var right: TreeNode? = nil
    var val: Int
    
    init(_ value: Int, leftNode left:TreeNode? = nil, rightNode right:TreeNode? = nil) {
        val = value
        self.left = left
        self.right = right
    }
}

public class BSTIterator {
    private var stack = [TreeNode]()
    
    internal init(_ treeNode: TreeNode) {
        buildIterator(treeNode)
    }
    
    public func hasNext() -> Bool {
        return !stack.isEmpty
    }
    
    public func next() -> Int {
        let temp = stack.removeLast()
        if let right = temp.right {
            buildIterator(right)
        }
        
        return temp.val
    }
    
    internal func buildIterator(_ node: TreeNode) {
        var node = node
        stack.append(node)
        
        while let left = node.left {
            node = left
            stack.append(node)
        }
    }
    
    func displayStack() {
        var temp = stack
        while temp.count > 0 {
            let i = temp.removeFirst()
            print(i.val)
        }
    }
}

//          8
//        /   \
//       3     10
//      / \      \
//     1   6     14
//        / \    /
//       4   7  13
// inorder: // [1, 3, 4, 6, 7, 8, 10, 13, 14]
// preorder:   [8, 3, 1, 6, 4, 7, 10, 14, 13]
// postorder:  [1, 4, 7, 6, 3, 13, 14, 10, 8]

let one = TreeNode(1, leftNode: nil, rightNode: nil)
let four = TreeNode(4, leftNode: nil, rightNode: nil)
let seven = TreeNode(7, leftNode: nil, rightNode: nil)
let six = TreeNode(6, leftNode: four, rightNode: seven)
let three = TreeNode(3, leftNode: one, rightNode: six)

let thirteen = TreeNode(13, leftNode: nil, rightNode: nil)
let fourteen = TreeNode(14, leftNode: thirteen, rightNode: nil)
let ten = TreeNode(10, leftNode: nil, rightNode: fourteen)

let root = TreeNode(8, leftNode: three, rightNode: ten)

let temp = BSTIterator(root)

temp.next() // 1
temp.next() // 3
temp.next() // 4
temp.next() // 6
temp.next() // 7
temp.next() // 8
temp.hasNext()
temp.next() // 10
temp.next() // 13
temp.next() // 14

// Solution 3: Swift - BST Recursion - inorder

public class BSTRecursion {
    var res = [Int]()
    init(_ root: TreeNode) {
        inorder(root)
    }
    
    func inorder(_ node: TreeNode) {
        if let left = node.left {
            inorder(left)
        }
        res.append(node.val)
        if let right = node.right {
            inorder(right)
        }
    }
}
let temp2 = BSTRecursion(root)
temp2.res // [1, 3, 4, 6, 7, 8, 10, 13, 14]

// Solution Swift: Recursion pre-order
public class BSTRecursion {
    var res = [Int]()
    init(_ root: TreeNode) {
        inorder(root)
    }
    
    func inorder(_ node: TreeNode) {
        res.append(node.val)
        
        if let left = node.left {
            inorder(left)
        }
        if let right = node.right {
            inorder(right)
        }
    }
}
let temp2 = BSTRecursion(root)
temp2.res // [8, 3, 1, 6, 4, 7, 10, 14, 13]

// Solution Recursion post-order
public class BSTRecursion {
    var res = [Int]()
    init(_ root: TreeNode) {
        inorder(root)
    }
    
    func inorder(_ node: TreeNode) {
        if let left = node.left {
            inorder(left)
        }
        if let right = node.right {
            inorder(right)
        }
        res.append(node.val)
    }
}
let temp2 = BSTRecursion(root)
temp2.res // [1, 4, 7, 6, 3, 13, 14, 10, 8]

/**
public class PostOrderBinaryTreeIteratorImpl implements PostOrderBinaryTreeIterator {
    Stack<TreeNode> stack = new Stack<TreeNode>();
    
    /** find the first leaf in a tree rooted at cur and store intermediate nodes */
    private void findNextLeaf(TreeNode cur) {
        while (cur != null) {
            stack.push(cur);
            if (cur.left != null) {
                cur = cur.left;
            } else {
                cur = cur.right;
            }
        }
    }
    
    /** Constructor */
    public PostOrderBinaryTreeIterator(TreeNode root) {
        findNextLeaf(root);
    }
    
    /** {@inheritDoc} */
    @Override
    public boolean hasNext() {
        return !stack.isEmpty();
    }
    
    /** {@inheritDoc} */
    @Override
    public Integer next() {
        if (!hasNext()) {
            throw new NoSuchElementException("All nodes have been visited!");
        }
        
        TreeNode res = stack.pop();
        if (!stack.isEmpty()) {
            TreeNode top = stack.peek();
            if (res == top.left) {
                findNextLeaf(top.right); // find next leaf in right sub-tree
            }
        }
        
        return res.val;
    }
    
    @Override
    public void remove() {  
        throw new UnsupportedOperationException("remove() is not supported.");  
    }  
}
 */

class BSTIteratorPostOrder {
    var stack = [TreeNode]()
    
    internal init(_ root: TreeNode) {
        findNextLeaf(root)
    }
    
    public func findNextLeaf(_ node: TreeNode?) {
        var node = node
        
        while node != nil {
            stack.append(node!)
            if let left = node?.left {
                node = left
            }
            else {
                node = node?.right
            }
        }
        
    }
    
    public func next() -> Int {
        let temp = stack.removeLast()
        if !stack.isEmpty {
            let top = stack.last
            if temp == top?.left, let right = top?.right {
                findNextLeaf(right)
            }
        }
        
        return temp.val
    }
    
    public func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

let temp3 = BSTIteratorPostOrder(root)
temp3.next() // 1
temp3.next() // 4
temp3.next() // 7
temp3.next() // 6
temp3.next() // 3
temp3.next() // 13
temp3.next() // 14
temp3.next() // 10
temp3.next() // 8
