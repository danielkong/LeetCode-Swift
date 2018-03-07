// 140. Word Break II
/**
Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. You may assume the dictionary does not contain duplicate words.

Return all such possible sentences.

For example, given
s = "catsanddog",
dict = ["cat", "cats", "and", "sand", "dog"].

A solution is ["cats and dog", "cat sand dog"].

UPDATE (2017/1/4):
The wordDict parameter had been changed to a list of strings (instead of a set of strings). Please reload the code definition to get the latest changes.
*/

class Solution {
    var map = [String: [String]]()
//    var test = Dictionary<String, [String]>()
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        if map[s] != nil {
            return map[s]!
        }
        var res = [String]()
        if s.count == 0 {
            res.append("")
            return res
        }
        
        for word in wordDict {
            if s.hasPrefix(word) {
                let sublist = wordBreak(String(Array(s.characters)[word.count..<s.count]), wordDict)
                for sub in sublist {
                    let temp = word + (sub.isEmpty ? "" : " ") + sub
                    res.append(temp)
                }
            }
        }
        map[s] = res
        return res
    }