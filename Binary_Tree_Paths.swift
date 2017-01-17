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
// Solution: DFS

    func DFS(node: TreeNode?, path: String, isRoot: Bool) -> Void {
        if let node = node {
            if node.left == nil && node.right == nil {
                treePaths.append(path + "->\(node.val)")
            } else {
                let path = isRoot ? String(node.val) : path + "->\(node.val)"
                if node.left != nil {
                    DFS(node: node.left, path: path, isRoot: false)
                }
                if node.right != nil {
                    DFS(node: node.right, path: path, isRoot: false)
                }
            }
        }
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if  let root = root {
            DFS(node: root, path: "", isRoot: true)
        }
        return treePaths
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

