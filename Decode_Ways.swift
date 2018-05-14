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
    Idea: DP. Tricky is handle "0", so from end to start.
    if two possible number, dp[i] = dp[i+1] + dp[i+2], otherwise, dp[i] = dp[i+1]

 */
 // Solution Swift: -- easy understand
 // 
class Solution {
    func numDecodings(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let sch = Array(s)
        var dp = Array(repeating: 0, count: s.count+1)
        dp[s.count] = 1
        dp[s.count-1] = sch[s.count-1] != "0" ? 1 : 0
        
        for i in stride(from: s.count-2, through:0, by: -1) {
            if sch[i] == "0" { continue }
            else {
                dp[i] = dp[i+1] + (validNum(String(sch[i...i+1])) ? dp[i+2] : 0)
            }
        }
        return dp[0]
    }
        
    private func validNum(_ s: String) -> Bool {
        if let num = Int(s) {
            if num <= 26 { return true }
        }
        return false
    }
}

/**
 * Primary idea: Dynamic Programming, dp[i] = dp[i - 1] + dp[i - 2],
 *               determine if current one or two characters are number at first
 * Time Complexity: O(n) 
 * Space Complexity: O(n)
 *
 * This problem can be solve by using dynamic programming. It is similar to the problem of counting ways of climbing stairs. The relation is dp[n]=dp[n-1]+dp[n-2].
 */
 // if single letter is 0, do not do dp[i] += dp[i-1]
 // if double letters(num) are satisfied with  1 <= num <= 26 and i >=2, do dp[i] += d[i-2]
class Solution {
    func numDecodings(_ s: String) -> Int {
         var dp = Array(repeating: 0, count: s.count+1)
        dp[0] = 1
        let sch = Array(s)
        
        guard s.count >= 1 else { return 0 }
        for i in 1...s.count {
            if isValid(String(sch[i-1..<i])) {
                dp[i] += dp[i-1]
            }
            if i >= 2 && isValid(String(sch[i-2..<i])) {
                dp[i] += dp[i-2]
            }
        }
        return dp[s.count]
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
