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