// 844. Backspace String Compare Easy
/**
Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

Example 1:

Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
Example 2:

Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".
Example 3:

Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".
Example 4:

Input: S = "a#c", T = "b"
Output: false
Explanation: S becomes "c" while T becomes "b".
Note:

1 <= S.length <= 200
1 <= T.length <= 200
S and T only contain lowercase letters and '#' characters.
*/
/**
    Solution 1: Array and trimmed string
                Runtime O(N)
                Space O(N)
    Solution 2: Two pointer from end of string,
                Meet # skip next ch, i--, j--
                Runtime O(N)
                Space O(1)

*/


class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return trimString(S) == trimString(T)
    }
    private func trimString(_ input: String) -> [Character] {
        var res = [Character]()
        for ch in Array(input) {
            if ch == "#" {
                if  res.count > 0 {
                    res.removeLast()
                }
            } else {
                res.append(ch)
            }
        }
        return res
    }
}