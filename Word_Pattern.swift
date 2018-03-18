// 290. Word Pattern
/**
Given a pattern and a string str, find if str follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.

Examples:
pattern = "abba", str = "dog cat cat dog" should return true.
pattern = "abba", str = "dog cat cat fish" should return false.
pattern = "aaaa", str = "dog cat cat dog" should return false.
pattern = "abba", str = "dog dog dog dog" should return false.
Notes:
You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.
*/

// Solution: runtime O(n), space O(n+m)

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let words = str.components(separatedBy: " ")
        guard pattern.count == words.count else { return false }
        
        let pch = Array(pattern)
        var dict = [Character: Int]()
        var worddict = [String: Int]()
        for (i,p) in pch.enumerated() {
            if dict[p] == nil { dict[p] = i }
            if worddict[words[i]] == nil { worddict[words[i]] = i }
            if dict[p] != worddict[words[i]] { return false }
        }
        return true
    }
}