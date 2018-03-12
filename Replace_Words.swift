648. Replace Words
/**
In English, we have a concept called root, which can be followed by some other words to form another longer word - let's call this word successor. For example, the root an, followed by other, which can form another word another.

Now, given a dictionary consisting of many roots and a sentence. You need to replace all the successor in the sentence with the root forming it. If a successor has many roots can form it, replace it with the root with the shortest length.

You need to output the sentence after the replacement.

Example 1:
Input: dict = ["cat", "bat", "rat"]
sentence = "the cattle was rattled by the battery"
Output: "the cat was rat by the bat"
Note:
The input will only have lower-case letters.
1 <= dict words number <= 1000
1 <= sentence words number <= 1000
1 <= root length <= 100
1 <= sentence words length <= 1000
*/

// solution: failed on limit time out 
// runtime: O(n*m) space: O()
class Solution {
    // if multiple roots, then choose shortest one
    // 
    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        var words = sentence.components(separatedBy: " ")
        var map = [String : Int]()
        for d in dict {
            map[d] = map[d] == nil ? 1 : map[d]!+1
        }
        
        var res = [String]()
        for word in words {
            var chs = Array(word.characters)
            shortLoop: for i in 1...chs.count {
                let temp = String(chs[0..<i])
                if map[temp] != nil {
                    res.append(temp)
                    break shortLoop
                }
                if i == chs.count {
                    res.append(word)
                }
            }
        }
        
        return res.joined(separator: " ")
    }
}

    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        var words = sentence.components(separatedBy: " ")
        var map = [String : Int]()
        for d in dict {
            map[d] = map[d] == nil ? 1 : map[d]!+1
        }
        
        // var res = [String]()
        var res = String()
        for (idx, word) in words.enumerated() {
            var chs = Array(word.characters)
            shortLoop: for i in 1...chs.count {
                let temp = String(chs[0..<i])
                if map[temp] != nil {
                    
                    res.append(temp + ((idx != words.count-1) ? " " : ""))
                    break shortLoop
                }
                if i == chs.count {
                    res.append(word + ((idx != words.count-1) ? " " : ""))
                }
            }
        }
        
        return res
        // return res.joined(separator: " ")
    }