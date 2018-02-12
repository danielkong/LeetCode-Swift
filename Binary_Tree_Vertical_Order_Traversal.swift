// 314 Binary Tree Vertical Order Traversal     | 35.3%  |  Medium | 
/**
Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

If two nodes are in the same row and column, the order should be from left to right.

Examples:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
 

return its vertical order traversal as:

[
  [9],
  [3,15],
  [20],
  [7]
]
 

Given binary tree [3,9,20,4,5,2,7],

    _3_
   /   \
  9    20
 / \   / \
4   5 2   7
 

return its vertical order traversal as:

[
  [4],
  [9],
  [3,5,2],
  [20],
  [7]
]
*/

// Solution: Java
/** 
The following solution takes 5ms.

BFS, put node, col into queue at the same time
Every left child access col - 1 while right child col + 1
This maps node into different col buckets
Get col boundary min and max on the fly
Retrieve result from cols
Note that TreeMap version takes 9ms.

public List<List<Integer>> verticalOrder(TreeNode root) {
    List<List<Integer>> res = new ArrayList<>();
    if (root == null) {
        return res;
    }
    
    Map<Integer, ArrayList<Integer>> map = new HashMap<>();
    Queue<TreeNode> q = new LinkedList<>();
    Queue<Integer> cols = new LinkedList<>();

    q.add(root); 
    cols.add(0);

    int min = 0;
    int max = 0;
    
    while (!q.isEmpty()) {
        TreeNode node = q.poll();
        int col = cols.poll();
        
        if (!map.containsKey(col)) {
            map.put(col, new ArrayList<Integer>());
        }
        map.get(col).add(node.val);

        if (node.left != null) {
            q.add(node.left); 
            cols.add(col - 1);
            min = Math.min(min, col - 1);
        }
        
        if (node.right != null) {
            q.add(node.right);
            cols.add(col + 1);
            max = Math.max(max, col + 1);
        }
    }

    for (int i = min; i <= max; i++) {
        res.add(map.get(i));
    }

    return res;
}
*/
// Swift solution
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
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var res = [[Int]]()
        var dict = [Int: [Int]]()
        
        var q = [TreeNode]()
        q.append(root)
        
        var cols = [Int]()
        cols.append(0)
        
        var minRange = 0, maxRange = 0
        
        while q.count > 0 {
            let node = q.removeFirst()
            let col = cols.removeFirst()
            
            if dict[col] == nil {
                dict[col] = []
            }
            dict[col]!.append(node.val)
            
            if let nleft = node.left {
                q.append(nleft)
                cols.append(col-1)
                minRange = min(minRange, col-1)
            }
            
            if let nright = node.right {
                q.append(nright)
                cols.append(col+1)
                maxRange = max(maxRange, col+1)
            }
        }
        
        for i in minRange...maxRange {
            res.append(dict[i]!)
        }
        
        return res
    }
}
/** Change to removeFirst() from removeLast() solve the problem
 input: [3,9,8,4,0,1,7]
        3
    9       8
 4     0 1     7
 
 Output:
 [[4],[9],[3,1,0],[8],[7]]
 Expected:
 [[4],[9],[3,0,1],[8],[7]]
 */
