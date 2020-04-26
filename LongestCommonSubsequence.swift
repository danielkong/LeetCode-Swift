// 1143. Longest Common Subsequence
/**
Given two strings text1 and text2, return the length of their longest common subsequence.

A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

 

If there is no common subsequence, return 0.

 

Example 1:

Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
Example 2:

Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
Example 3:

Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
 

Constraints:

1 <= text1.length <= 1000
1 <= text2.length <= 1000
The input strings consist of lowercase English characters only.
*/
// Solution: 2D DP
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let chs1 = Array(text1)
        let chs2 = Array(text2)
        let count1 = chs1.count 
        let count2 = chs2.count
        guard count1 > 0 && count2 > 0 else { return 0 }

        var dp = Array(repeating: Array(repeating: 0, count:count2+1), count:count1+1)

        for col in stride(from:count2-1, through: 0, by: -1) {
            for row in stride(from:count1-1, through: 0, by: -1) {
                if chs1[row] == chs2[col] {
                    dp[row][col] = dp[row+1][col+1] + 1
                } else {
                    dp[row][col] = max(dp[row+1][col], dp[row][col+1])
                }
            }
        }
        return dp[0][0]
    }