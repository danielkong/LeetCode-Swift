// 953. Verifying an Alien Dictionary
/**

In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.



Example 1:

Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
Output: true
Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.

Example 2:

Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
Output: false
Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.

Example 3:

Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
Output: false
Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
 

Constraints:

1 <= words.length <= 100
1 <= words[i].length <= 20
order.length == 26
All characters in words[i] and order are English lowercase letters.

*/
/**
	Idea: 
		1. Traverse alien dictionary to provide the weight of each character.
		2. Compare adjcent two words each letter from 0 .. < min(word1.count, word2.count)
		3. Plus corner case: apple v.s. applepine
*/
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dict = [Character : Int]()
        var i = 0
        for ch in Array(order) {
            dict[ch] = i
            i+=1
        }


        for i in 0..<words.count - 1 {
            let currChs = Array(words[i]), nextChs = Array(words[i + 1])
            var j = 0

            while j < min(currChs.count, nextChs.count) {
                let currentChar = currChs[j], nextChar = nextChs[j]

                guard currentChar != nextChar else {
                    j += 1
                    continue
                }

                if dict[currentChar]! > dict[nextChar]! {
                    return false
                } else {
                    break
                }
            }

            if j == nextChs.count && currChs.count > nextChs.count {
                return false
            }
        }
        return true
    }

