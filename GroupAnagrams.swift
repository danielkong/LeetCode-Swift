// 49        Group Anagrams        31.8%        Medium        
/**
Given an array of strings, group anagrams together.

For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
Return:

[
  ["ate", "eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note: All inputs will be in lower-case.
*/
/**
 * Solution: Iterate the string array and categories strings with the same sorted one
 *
 * Time Complexity: O(nmlogm + nlogn), n stands for number of words, m stands for the length of a word
 *                  Space Complexity: O(n)
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        for str in strs {
            let key = String(str.characters.sorted())

            if let list = map[key] {
                var temp = list
                temp.append(str)
                map[key] = temp
            } else {
                map[key] = [str]
            }
        }
        return map.values.map { value in value.sorted() }
    }
}

// Runtime: O(nmlogm), Space: O(n)

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String : [String]]()
        
        for str in strs {
            let chs = String(str.characters.sorted())
            if map[chs] != nil {
                map[chs]!.append(str)
            } else {
                map[chs] = [str]
            }
        }
        
        var res = [[String]]()
        for key in map.keys {
            res.append(map[key]!)
        }
        return res
    }
}
