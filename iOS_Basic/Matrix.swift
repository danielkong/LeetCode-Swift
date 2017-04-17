// 542. 01 Matrix
/**
Given a matrix consists of 0 and 1, find the distance of the nearest 0 for each cell.

The distance between two adjacent cells is 1.
Example 1: 
Input:

0 0 0
0 1 0
0 0 0

Output:

0 0 0
0 1 0
0 0 0

Example 2: 
Input:

0 0 0
0 1 0
1 1 1

Output:

0 0 0
0 1 0
1 2 1

Note:
The number of elements of the given matrix will not exceed 10,000.
There are at least one 0 in the given matrix.
The cells are adjacent in only four directions: up, down, left and right.

*/

Solution: DP . First though use binary get 0, and then calculate distance, but foundmaybe not shortest distance

class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count
        let n = matrix[0].count
        
        // built dp
        var temp = Array(repeating:  m + n, count: n)
        var dp = [[Int]]()
        for i in 0 ..< m {
            dp.append(temp)
        }
        // top left
        for i in 0 ..< m {
            for j in 0 ..< n {
                if matrix[i][j] == 0 {
                    dp[i][j] = 0
                } else {
                    let left = j-1 >= 0 ? dp[i][j - 1] : dp[i][j]
                    let top = i-1 >= 0 ? dp[i - 1][j] : dp[i][j] 
		            dp[i][j] = min(dp[i][j], min(top, left) + 1)
                }
            }
        }
        // down right
        for i in stride(from: m-1, to: -1, by: -1) {
            for j in stride(from: n-1, to: -1, by: -1) {
                if dp[i][j] != 0 && dp[i][j] != 1 {
                    let down = i+1 < m ? dp[i+1][j] : dp[i][j]
                    let right = j+1 < n ? dp[i][j+1] : dp[i][j]
                    dp[i][j] = min(dp[i][j], min(down, right) + 1)
                }
            }
            
        }
        
        return dp
    }
}