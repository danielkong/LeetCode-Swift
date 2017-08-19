// 44        Wildcard Matching        19.0%        Hard
/**
Implement wildcard pattern matching with support for '?' and '*'.

'?' Matches any single character.
'*' Matches any sequence of characters (including the empty sequence).

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "*") → true
isMatch("aa", "a*") → true
isMatch("ab", "?*") → true
isMatch("aab", "c*a*b") → false
*/
/**
https://www.gjczz.com/p/KiA4JRWZ/flmian-jing/
2016-06-27 09:32 | mitbbs | 待字闺中

Given a list of strings and an input string with wildcard (e.g. A?? or B?A?), check if the list
contains the input。用Prefix tree直接上，答的还可以。
*/

// Solution 1: Runtime: O(m+n) Space: O(n)(not swift, then O(1))
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let schars = [Character](s.characters)
        let pchars = [Character](p.characters)

        var sIndex = 0
        var pIndex = 0
        var startIndex = -1
        var match = 0

        while sIndex < schars.count {
            if pIndex < pchars.count && (schars[sIndex] == pchars[pIndex] || pchars[pIndex] == "?") {
                sIndex += 1
                pIndex += 1

            } else if pIndex < pchars.count && pchars[pIndex] == "*" {
                startIndex = pIndex
                match = sIndex
                pIndex += 1
            } else if startIndex != -1 {
                pIndex = startIndex + 1
                match += 1
                sIndex = match
            } else {
                return false
            }
        }

        while pIndex < pchars.count && pchars[pIndex] == "*" {
            pIndex += 1
        }

        return pIndex == pchars.count
    }
}
