// 62. Unique Paths
/**
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
How many possible unique paths are there?

Note: m and n will be at most 100.

*/
// Solution: Runtime O(mn), Space O(mn)
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count:m), count:n)
        for i in 0..<m {
            dp[0][i] = 1
        }
        for i in 0..<n {
            dp[i][0] = 1
        }
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[n-1][m-1]
    }
}

// Enhanced: runtime O(mn), space O(m)
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m > n { return uniquePaths(n, m) }
        var dp = Array(repeating: 1, count: m)
        for j in 1 ..< n {
            for i in 1 ..< m {
                dp[i] += dp[i-1]
            }
        }
        return dp[m-1]
    }
}

// Formula Solution runtime and space 1
// (m+n)! / (m! * n!) and so now we only calculate (m+1)(m+2)..(m+n) / n!

public class Solution {
    public int uniquePaths(int m, int n) {
        if(m == 1 || n == 1)
            return 1;
        m--;
        n--;
        if(m < n) {              // Swap, so that m is the bigger number
            m = m + n;
            n = m - n;
            m = m - n;
        }
        long res = 1;
        int j = 1;
        for(int i = m+1; i <= m+n; i++, j++){       // Instead of taking factorial, keep on multiply & divide
            res *= i;
            res /= j;
        }

        return (int)res;
    }
}

/**
Follow up for "Unique Paths":

Now consider if some obstacles are added to the grids. How many unique paths would there be?

An obstacle and empty space is marked as 1 and 0 respectively in the grid.

For example,
There is one obstacle in the middle of a 3x3 grid as illustrated below.

[
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
The total number of unique paths is 2.

Note: m and n will be at most 100.
*/
// Swift: Runtime O(mn), Space O(mn)
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    if obstacleGrid[0][0] == 1 || obstacleGrid[m-1][n-1] == 1  {
        return 0
    }
    var arr = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0 ..< m {
        for j in 0 ..< n {
            if obstacleGrid[i][j] != 1 {
                if i == 0 {
                    arr[i][j] = j != 0 ? arr[i][j-1] : 1
                } else if j == 0 {
                    arr[i][j] = i != 0 ? arr[i-1][j] : 1
                }
                else {
                    arr[i][j] = arr[i-1][j] + arr[i][j-1]
                }
            }
        }
    }
    return arr[m-1][n-1]
}
// Short Solution: Runtime: O(mn), Space: O(mn)
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count

    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    dp[0][1] = 1
    for i in 1...m {
        for j in 1...n {
            if obstacleGrid[i-1][j-1] != 1 {
                dp[i][j] = dp[i-1][j]+dp[i][j-1]
            }
        }
    }
    return dp[m][n]
}
