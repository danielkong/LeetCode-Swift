// 639. Decode Ways II  -- Hard
/**
	A message containing letters from A-Z is being encoded to numbers using the following mapping way:

	'A' -> 1
	'B' -> 2
	...
	'Z' -> 26
	Beyond that, now the encoded string can also contain the character '*', which can be treated as one of the numbers from 1 to 9.

	Given the encoded message containing digits and the character '*', return the total number of ways to decode it.

	Also, since the answer may be very large, you should return the output mod 109 + 7.

	Example 1:
	Input: "*"
	Output: 9
	Explanation: The encoded message can be decoded to the string: "A", "B", "C", "D", "E", "F", "G", "H", "I".
	Example 2:
	Input: "1*"
	Output: 9 + 9 = 18
	Note:
	The length of the input string will fit in range [1, 105].
	The input string will only contain the character '*' and digits '0' - '9'.
*/

// Time: O(N), Space: O(1)
// https://discuss.leetcode.com/topic/95301/python-straightforward-with-explanation

class Solution {
    func numDecodings(_ s: String) -> Int {
        let chs = Array(s.characters)
        let len = chs.count

        var dp = Array(repeating: 0, count:2)
        dp[0] = ways(String(chs[0]))

        if len < 2 { return dp[0] }

        dp[1] = dp[0] * ways(String(chs[1])) + ways(String(chs[0]), String(chs[1]))

        for i in 2 ..< len {
            let temp = dp[1]
            let test = dp[1] * ways(String(chs[i]))
            let finish = dp[0] * ways(String(chs[i-1]), String(chs[i]))
            dp[1] = (test + finish) % 1000000007
            dp[0] = temp
        }

        return dp[1]
    }

    func ways(_ ch: String) -> Int {
        if ch == "*" { return 9 }
        if ch == "0" { return 0 }
        return 1
    }

    func ways(_ ch1: String, _ ch2: String) -> Int {
        if ch1 == "*" && ch2 == "*" {
            return 15
        } else if ch1 != "*" && ch2 == "*" {
            if let int1 = Int(ch1) {
                // if int1 == 0 { return 1 }
                if int1 == 1 { return 9 }
                else if int1 == 2 { return 6 }
            }
        } else if ch1 == "*" && ch2 != "*" {
            if let int2 = Int(ch2) {
                if int2 >= 0 && int2 <= 6 {
                    return 2
                } else {
                    return 1
                }
            }
        } else {
            if let combine = Int(ch1 + ch2) {
                if combine >= 10 && combine <= 26 { return 1 }
            }
        }

        return 0
    }
}
