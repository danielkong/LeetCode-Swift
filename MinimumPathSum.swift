// 64. Minimum Path Sum
/**
Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example:

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.
*/
// Solution: 2D DP
//  Runtime: O(M*N)
//  Space: O(M*N)
func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else { return 0 }
    let n = grid.count
    let m = grid[0].count
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)

    dp[0][0] = grid[0][0]
    print("test i")

    for i in 1..<n {
        dp[i][0] = grid[i][0] + dp[i-1][0]
    }
    print("test j")
    for j in 1..<m {
        dp[0][j] = grid[0][j] + dp[0][j-1]
    }

    dfs(grid, 1, 1, n, m, &dp)
    return dp[n-1][m-1]
}

private func dfs(_ grid: [[Int]], _ i: Int, _ j: Int, _ n: Int, _ m: Int, _ dp: inout [[Int]]) {
    if i < n && j < m {
        dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
        print(dp)
        print("i: \(i)")
        print("j: \(j)")

        dfs(grid, i+1, j, n, m, &dp)
        dfs(grid, i, j+1, n, m, &dp)
    }
}

// Solution 1D DP
//  Runtime: O(M*N)
//  Space: O(M)
func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else { return 0 }
    let n = grid.count
    let m = grid[0].count
    var dp = Array(repeating: 0, count: m)

    for i in stride(from: n-1, to: -1, by: -1) {
        for j in stride(from: m-1, to: -1, by: -1) {
            if i == n-1 && j != m-1 {
                dp[j] = grid[i][j] + dp[j+1]
            } 
            else if i != n-1 && j == m-1 {
                dp[j] = grid[i][j] + dp[j]
            } 
            else if i != n-1 && j != m-1 {
                dp[j] = grid[i][j] + min(dp[j], dp[j+1])
            } 
            else {
                dp[j] = grid[i][j]
            }
        }
    }
    return dp[0]
}