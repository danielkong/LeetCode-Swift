// 695. Max Area of Island Medium
/**
Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

Example 1:

[[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
Example 2:

[[0,0,0,0,0,0,0,0]]
Given the above grid, return 0.
Note: The length of each dimension in the given grid does not exceed 50.
*/

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var max_area = 0;
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == 1 {
                    max_area = max(max_area, AreaOfIsland(&grid, i, j))
                }
            }
        }
        return max_area;
    }

    
    func AreaOfIsland(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
        if( i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == 1) {
            grid[i][j] = 0
            return 1 + AreaOfIsland(&grid, i+1, j) + AreaOfIsland(&grid, i-1, j) + AreaOfIsland(&grid, i, j-1) + AreaOfIsland(&grid, i, j+1)
        }
        return 0
    }