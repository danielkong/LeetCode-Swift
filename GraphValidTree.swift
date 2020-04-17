// 261        Graph Valid Tree         36.5%        Medium      
/**
Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.

For example:

Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.

Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.

Hint:

Given n = 5 and edges = [[0, 1], [1, 2], [3, 4]], what should your return? Is this case a valid tree?
According to the definition of tree on Wikipedia: “a tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.”
Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
*/

/**
Solution 1: DFS
            Traversal edges and create dictionary node:neighbors 
            Use DFS to check whether have seen neighbors

Solution 2:	Union-Find Algorithm - network connectivity
			 union command: connect two objects
			 find query: is there a path connecting one object to another
			 	quick-find. may tak ~MN steps, M union command on N objects                     union N, find 1
				quick-union. root of i is id[id[...id[i]...]]  while (i != id[i]) i = id[i]		union N, find N
				enhance - weighted quick-union, avoid tall trees, reverse link			weighted QU  lgN,    lgN
				http://www.geeksforgeeks.org/union-find/
				
*/
class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n-1 { return false }
        var dict = [Int: [Int]]()
        var seen = Set<Int>()
        for edge in edges {
            if dict[edge[0]] != nil {
                dict[edge[0]]!.append(edge[1])
            } else {
                dict[edge[0]] = [edge[1]]
            }
            
            if dict[edge[1]] != nil {
                dict[edge[1]]!.append(edge[0])
            } else {
                dict[edge[1]] = [edge[0]]
            }
        }
        
        return dfs(0, -1, &seen, dict) && seen.count == n
    }
    
    func dfs(_ node: Int, _ parent: Int, _ seen: inout Set<Int>, _ dict: [Int: [Int]]) -> Bool {
        if (seen.contains(node)) { return false }
        seen.insert(node)
        if let neighbors = dict[node] {
            for neighbor in neighbors {
                if parent != neighbor {
                    let res = dfs(neighbor, node, &seen, dict)
                    if (!res) { return false }
                }
            }  
        }

        return true
    } 
}

// Solution 2: Union Find 
//      Runtime: 
//      Space:
    public boolean validTree(int n, int[][] edges) {
        // initialize n isolated islands
        int[] nums = new int[n];
        Arrays.fill(nums, -1);
        
        // perform union find
        for (int i = 0; i < edges.length; i++) {
            int x = find(nums, edges[i][0]);
            int y = find(nums, edges[i][1]);
            
            // if two vertices happen to be in the same set
            // then there's a cycle
            if (x == y) return false;
            
            // union
            nums[x] = y;
        }
        
        return edges.length == n - 1;
    }
    
    int find(int nums[], int i) {
        if (nums[i] == -1) return i;
        return find(nums, nums[i]);
    }