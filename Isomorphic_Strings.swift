// 205. Isomorphic Strings

/**
Given two strings s and t, determine if they are isomorphic.

Two strings are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

For example,
Given "egg", "add", return true.

Given "foo", "bar", return false.

Given "paper", "title", return true.

Note:
You may assume both s and t have the same length.
*/


class Solution {
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var sdict = [Character: Int]()
        var tdict = [Character: Int]()
        let tchs = Array(t)
        
        for (i, ch) in Array(s).enumerated() {
            if tdict[tchs[i]] == nil { tdict[tchs[i]] = i }
            if sdict[ch] == nil { sdict[ch] = i }
            if tdict[tchs[i]] != sdict[ch] { return false }
        }
        return true
    }
    
}