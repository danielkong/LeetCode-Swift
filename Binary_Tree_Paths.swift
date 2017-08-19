/** 257. Binary Tree Paths
Given a binary tree, return all root-to-leaf paths.

For example, given the following binary tree:

   1
 /   \
2     3
 \
  5
All root-to-leaf paths are:

["1->2->5", "1->3"]
*/
/**
https://www.glassdoor.com/Interview/Questions-Print-all-paths-in-a-binary-tree-Function-to-find-the-square-root-of-a-number-Pretty-print-JSON-object-QTN_834854.htm
*/
// Solution: DFS

class Solution {
    var treePaths = [String]()
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        DFS(node: root, path: "", isRoot: true)
        return treePaths
    }
    
    func DFS(node: TreeNode?, path: String, isRoot: Bool) -> Void {
        guard let node = node else {
            return
        }
        let path = isRoot ? "\(node.val)" : path + "->\(node.val)"
        if node.left == nil && node.right == nil {
            treePaths.append(path)
        }
        DFS(node: node.left, path: path, isRoot: false)
        DFS(node: node.right, path: path, isRoot: false)
    }
}

// Do not use global variable solution
func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var res: [String] = []
    helper(root, "", &res)
    return res
}

private func helper(_ root: TreeNode?, _ buf: String, _ res: inout [String]) {
    guard let root = root else {
        return
    }
    if root.left == nil && root.right == nil {    // if it's a leaf node
        res.append(buf + "\(root.val)")
        return
    }
    helper(root.left,  buf + "\(root.val)->", &res)
    helper(root.right, buf + "\(root.val)->", &res)
}

// Use swift create treeNode structure
class TreeNode: NSObject {
    var left: TreeNode? = nil
    var right: TreeNode? = nil
    var val: Int

    init(value: Int, leftNode left:TreeNode? = nil, rightNode right:TreeNode? = nil) {
        val = value
        self.left = left
        self.right = right
    }
}
    let five = TreeNode.init(value: 5)
    let three = TreeNode.init(value: 3)
    let one = TreeNode.init(value: 1)
    let two = TreeNode.init(value:2)
    let four = TreeNode.init(value: 4)

    two.right = four
    three.left = one
    three.right = two
    five.left = three

/**     5
       /
      3
     / \
    1   2
         \
          4
 */
    let strs: [String] = binaryTreePaths(five)
    print(strs)
