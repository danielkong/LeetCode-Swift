// 297        Serialize and Deserialize Binary Tree        31.5%        Hard     
/**
Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

For example, you may serialize the following tree

    1
   / \
  2   3
     / \
    4   5
as "[1,2,3,null,null,4,5]", just the same as how LeetCode OJ serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.


http://buttercola.blogspot.com/2015/10/leetcode-serialize-and-deserialize.html

*/
/**
    Idea:   Recursion(DFS), Iteration(BFS). 
            Here use iteration BFS. Queue implement 
    Runtime: O(N)
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

// Solution Swift Recursion.
/**
    1
   / \
  2   3
     / \
    4   5
                Recursion DFS                           Iteration BFS
but it saves as "1,2,nil,nil,3,4,nil,nil,5,nil,nil", not "[1,2,3,null,null,4,5]"

*/
public class TreeNode {
    let val: Int?
    let left: TreeNode?
    let right: TreeNode?
    init TreeNode(_ val: Int) {
        self.val = val
    }
}

public class Codec {
    struct Constant {
        let null = "nil"
    }
    public func serialize(_ root: TreeNode) -> String {
        var res = ""
        buildString(root, &res)
        return res
    }

    private func buildString(_ root: TreeNode?, _ res: inout String) {
        guard let root = root else { 
            res.append(Constant.null)
            res.append(",")
        }
        res.append(root.val)
        res.append(",")
        buildString(root.left, &res)
        buildString(root.right, &res)
    }

    public func deserialize(_ data: String) -> TreeNode {
        let items = data.componentSeparator(by: ",")
        return buildTree(items)
    }

    private func buildTree(_ items: [String]) -> TreeNode? {
        let val = items.removeFirst()
        if val == "nil" {
            return nil
        } else {
            let node = TreeNode(Int(val))
            node.left = buildTree(items)
            node.right = buildTree(items)
            return node
        }
    }

}

// Solution Java Recursion.
public class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        StringBuilder sb = new StringBuilder();
        buildString(root, sb);
        return sb.toString();
    }

    private void buildString(TreeNode node, StringBuilder sb) {
        if (node == null) {
            sb.append("X").append(",");
        } else {
            sb.append(node.val).append(",");
            buildString(node.left, sb);
            buildString(node.right, sb);
        }
    }
    
    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        Deque<String> nodes = new LinkedList<>();
        nodes.addAll(Arrays.asList(data.split(",")));
        return buildTree(nodes);
    }
    
    private TreeNode buildTree(Deque<String> nodes) {
        String val = nodes.remove();
        if (val.equals("X")) { return null; }
        else {
            TreeNode node = new TreeNode(Integer.valueOf(val));
            node.left = buildTree(nodes);
            node.right = buildTree(nodes);
            return node;
        }
    }
}

// Solution Java Iteraction.
public class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        if (root == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        
        LinkedList<TreeNode> queue = new LinkedList<TreeNode>();
        queue.add(root);
        sb.append("[");

        while (!queue.isEmpty()) {
            TreeNode temp = queue.poll();
            if (temp != null) {
                sb.append(String.valueOf(temp.val) + ",");
                queue.add(temp.left);
                queue.add(temp.right);
            } else {
                sb.append("null,");
            }
        }
        sb.deleteCharAt(sb.length()-1);
        sb.append("]");
        return sb.toString();
        
        
        
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        if (data == null || data.equals("[]")) {
            return null;
        }
        
        if (data.length() <= 2) {
            return null;
        }
        String[] arr = data.substring(1, data.length()-1).split(",");
        
        TreeNode root = new TreeNode(Integer.parseInt(arr[0]));
        LinkedList<TreeNode> queue = new LinkedList<TreeNode>();
        queue.add(root);
        
        int i = 1;
        while (!queue.isEmpty()) {
                TreeNode temp = queue.poll();
                
                if (temp == null) {
                    continue;
                }
                
                if (!arr[i].equals("null")) {
                    temp.left = new TreeNode(Integer.parseInt(arr[i]));
                    queue.offer(temp.left);
                } else {
                    temp.left = null;
                    queue.offer(null);
                }
                
                i++;
                
                if (!arr[i].equals("null")) {
                    temp.right = new TreeNode(Integer.parseInt(arr[i]));
                    queue.offer(temp.left);
                } else {
                    temp.right = null;
                    queue.offer(null);
                }
                
                i++;
        }
        return root;
    }
}

// Your Codec object will be instantiated and called as such:
// Codec codec = new Codec();
// codec.deserialize(codec.serialize(root));