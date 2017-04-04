// 463. Island Perimeter
/**
You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]

Answer: 16
Explanation: The perimeter is the 16 yellow stripes in the image below:
*/


// Solution: DFS Java
  public int islandPerimeter(int[][] grid) {
    if(grid.length == 0) return 0;
    for(int i = 0; i < grid.length; i++){
      for(int j = 0; j < grid[0].length; j++){
        if(grid[i][j] == 1){
          return helper(grid, i, j);
        }
      }  
    } 
    return 0;
  }
  
  private int helper(int[][] grid, int i, int j){
    grid[i][j] = -1;
    int count = 0;
    
    if(i - 1 < 0 || grid[i - 1][j] == 0) count++;
    else if(grid[i - 1][j] == 1) count += helper(grid, i - 1, j);
    
    if(i + 1 >= grid.length || grid[i + 1][j] == 0) count++;
    else if(grid[i + 1][j] == 1) count += helper(grid, i + 1, j);
    
    if(j - 1 < 0 || grid[i][j - 1] == 0) count++;
    else if(grid[i][j - 1] == 1) count += helper(grid, i, j - 1); 
    
    if(j + 1 >= grid[0].length || grid[i][j + 1] == 0) count++;
    else if(grid[i][j + 1] == 1) count += helper(grid, i, j + 1);
    
    return count;
  }

// Solution Swift: DFS. Runtime O(nm), Space O(nm) since needs create var grid. Won't pass on large dataset.
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else { return 0 }
        var vgrid = grid
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == 1 {
                    return helper(&vgrid, i, j)
                }
            } 
        }
        return 0
    }
    
    func helper(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
        grid[i][j] = -1
        var count = 0
        if i-1 < 0 || grid[i-1][j] == 0 { 
            count += 1 
        } else if grid[i-1][j] == 1 {
            count += helper(&grid, i-1, j)
        }
        if j-1 < 0 || grid[i][j-1] == 0 { 
            count += 1 
        } else if grid[i][j-1] == 1 {
            count += helper(&grid, i, j-1)
        }
        if i+1 >= grid.count || grid[i+1][j] == 0 { 
            count += 1 
        } else if grid[i+1][j] == 1 {
            count += helper(&grid, i+1, j)
        }
        if j+1 >= grid[0].count || grid[i][j+1] == 0 { 
            count += 1 
        } else if grid[i][j+1] == 1 {
            count += helper(&grid, i, j+1)
        }
        
        return count
    }
}

// Solution Swift: Runtime O(nm), Space O(1). Use islandCount, and neighborCount calculate.
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var islands = 0, neighbors = 0
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == 1 {
                    islands += 1
                    if i < grid.count - 1 && grid[i + 1][j] == 1 {
                        neighbors += 1
                    }
                    if (j < grid[0].count - 1 && grid[i][j + 1] == 1) {
                        neighbors += 1
                    }
                }
            }
        }
        
        return islands * 4 - neighbors * 2
    }
}