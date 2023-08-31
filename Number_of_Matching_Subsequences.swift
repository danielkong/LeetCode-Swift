// 792. Number of Matching Subsequences
/**
Given a string s and an array of strings words, return the number of words[i] that is a subsequence of s.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

For example, "ace" is a subsequence of "abcde".
 

Example 1:

Input: s = "abcde", words = ["a","bb","acd","ace"]
Output: 3
Explanation: There are three strings in words that are a subsequence of s: "a", "acd", "ace".
Example 2:

Input: s = "dsahjpjauf", words = ["ahjpjau","ja","ahbwzgqnuk","tnmlanowax"]
Output: 2
 

Constraints:

1 <= s.length <= 5 * 104
1 <= words.length <= 5000
1 <= words[i].length <= 50
s and words[i] consist of only lowercase English letters.
*/
// N words, each word length M, s L
// Runtime: O(L + N * (avg const number, worst N))
class Solution {
  func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
// func validWordInString(_ s: String, words: [String]) -> [String] {
    var nums = 0
    // var res = [String]()
    var dict = [Character: [Int]]()
    
    // build a char dictionary (key - char, value index in string)
    for (i, ch) in s.enumerated() {
      dict[ch, default: []].append(i)
    }

    // based on word check whether in the string
    for word in words {
      if wordIndexIncreasing(word, dict: dict) {
        // res.append(word)
        nums += 1
      }
    }
    return nums
  }

  func wordIndexIncreasing(_ word: String, dict: [Character: [Int]]) -> Bool {
    let chs = Array(word)
    var currentIdx = -1
    for ch in chs {
        guard let chIdxes = dict[ch] else {
            return false
        }
        var found = false
        for idx in chIdxes {
            if idx > currentIdx {
                currentIdx = idx
                found = true
                break
            }
        }
        if !found {
            return false
        }
    }
    return true
  }
}
