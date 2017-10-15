// 243. Shortest Word Distance
/**

Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.

For example,
Assume that words = ["practice", "makes", "perfect", "coding", "makes"].

Given word1 = “coding”, word2 = “practice”, return 3.
Given word1 = "makes", word2 = "coding", return 1.

Note:
You may assume that word1 does not equal to word2, and word1 and word2 are both in the list.

*/

// Runtime: O(n), Space: O(1)

class Solution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var idx1 = -1, idx2 = -1, res = words.count
        for (idx, word) in words.enumerated() {
            if word == word1 {
                idx1 = idx
            } else if word == word2 {
                idx2 = idx
            }
            if idx1 != -1 && idx2 != -1 {
                res = min(res, abs(idx1-idx2))
            }
        }
        return res
    }
}
