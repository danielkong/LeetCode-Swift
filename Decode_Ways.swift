// Decode_Ways
/**
A message containing letters from A-Z is being encoded to numbers using the following mapping:
'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of ways to decode it.

For example,
Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).
The number of ways decoding "12" is 2.
*/

/**
 * Question Link: https://leetcode.com/problems/decode-ways/
 * Primary idea: Dynamic Programming, dp[i] = dp[i - 1] + dp[i - 2], 
 *               determine if current one or two characters are number at first
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 * This problem can be solve by using dynamic programming. It is similar to the problem of counting ways of climbing stairs. The relation is dp[n]=dp[n-1]+dp[n-2].
 */
class Solution {
    func numDecodings(_ s: String) -> Int {
        let sChars = [Character](s.characters), len = sChars.count
        var dp = Array(repeating: 0, count: len + 1)
        dp[0] = 1
        
        guard len >= 1 else {
            return 0
        }
        
        for i in 1 ... len {
            if isValid(String(sChars[i - 1 ..< i])) {
                dp[i] += dp[i - 1]
            }
            if i >= 2 && isValid(String(sChars[i - 2 ..< i])) {
                dp[i] += dp[i - 2]
            }
        }
        
        return dp[len]
    }
    
    private func isValid(_ numStr: String) -> Bool {
        if Array(numStr.characters).first == "0" {
            return false
        }
    
        guard let num = Int(numStr) else {
            return false
        }
        
        return num >= 1 && num <= 26
    }
 }