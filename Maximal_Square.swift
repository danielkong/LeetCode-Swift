// 221        Maximal Square        27.0%        Medium
/**
Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

For example, given the following matrix:

1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0
Return 4.
*/

/**
 * Question Link: https://leetcode.com/problems/maximal-square/
 * Primary idea: Dynamic Programming, new one is equal to the min square width plus one
 * Time Complexity: O(mn), Space Complexity: O(mn)
 */

 func maximalSquare(_ matrix: [[Character]]) -> Int {
     if matrix.count == 0 {
         return 0
     }
     let m = matrix.count, n = matrix[0].count
     var res_side = 0
     var b = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
     for i in 1 ... m {
         for j in 1 ... n {
             if String(matrix[i-1][j-1]) == "1" {
                 if i == 0 || j == 0 {
                     b[i][j] = 1
                 } else {
                     b[i][j] = min(min(b[i][j-1] , b[i-1][j-1]), b[i-1][j]) + 1
                 }
                 res_side = max(b[i][j], res)
             }
         }
     }
     return res_side*res_side
 }
