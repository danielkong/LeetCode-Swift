// 200 Number of Islands        32.2%        Medium    
/**
Given a 2-d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

11110
11010
11000
00000
Answer: 1

Discussion:
DFS and BFS:
https://www.ics.uci.edu/~eppstein/161/960215.html
BFS -- from start of List -- Queue
DFS -- from end of List -- Stack

spanning tree: 
A complete undirected graph can have maximum nn-2 number of spanning trees.
Spanning tree has n-1 edges, where n is the number of nodes (vertices).

minimum spanning tree(MST)
Two MST both greedy algorithm
	Kruskal's Algorithm （array of distance）
	Prim's Algorithm ()
*/
/**
 * Question Link: https://leetcode.com/problems/number-of-islands/
 * Primary idea: Classic Depth-first Search, go up, down, left, right four directions
 * 
 * Time Complexity: O(mn), Space Complexity: O(1)
 *
 */
// space O(mn)
class Solution {
    var varGrid = [[Character]]()
    func numIslands(_ grid: [[Character]]) -> Int {
        varGrid = grid
        var count = 0
        for i in 0..<varGrid.count {
            for j in 0 ..< varGrid[0].count {
                if varGrid[i][j] == "1" {
                    dfs(varGrid, i, j)
                    count += 1
                }
            }
        }
        return count
    }
    
    private func dfs(_ grid: [[Character]], _ i: Int, _ j: Int) -> Void {
        if (i < 0 || j < 0 || i >= grid.count || j >= grid[0].count || grid[i][j] != "1") { return }
        varGrid[i][j] = "0"
        dfs(varGrid, i+1, j)
        dfs(varGrid, i-1, j)
        dfs(varGrid, i, j+1)
        dfs(varGrid, i, j-1)
    }
}

// Space: O(1)
class NumberofIslands {
    func numIslands(grid: [[Character]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else {
            return 0
        }
        
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var count = 0
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if String(grid[i][j]) == "1" {
                    count += 1
                    _dfs(&grid, m, n, i, j)
                }
            }
        }
        
        return count
    }
    
    private func _dfs(inout grid: [[Character]], _ m: Int, _ n: Int, _ i: Int, _ j: Int) {
        guard i >= 0 && i < m && j >= 0 && j < n && String(grid[i][j]) == "1" else {
            return
        }
        
        grid[i][j] = Character("0")
        
        _dfs(&grid, m, n, i + 1, j)
        _dfs(&grid, m, n, i - 1, j)
        _dfs(&grid, m, n, i, j + 1)
        _dfs(&grid, m, n, i, j - 1)
    }
}

