// 269. Alien Dictionary Hard
/**
There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.

Example 1:

Input:
[
  "wrt",
  "wrf",
  "er",
  "ett",
  "rftt"
]

Output: "wertf"
Example 2:

Input:
[
  "z",
  "x"
]

Output: "zx"
Example 3:

Input:
[
  "z",
  "x",
  "z"
] 

Output: "" 

Explanation: The order is invalid, so return "".
Note:

You may assume all letters are in lowercase.
You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
If the order is invalid, return an empty string.
There may be multiple valid order of letters, return any one of them is fine.
*/

class Solution {
    func alienOrder(_ words: [String]) -> String {
        var map = [Character: Set<Character>]()
        var degree = [Character: Int]()
        for str in words{
            for char in str{
                degree[char] = 0
            }
        }
        
        for i in 0..<words.count-1{
            var arr = Array(words[i])
            var brr = Array(words[i+1])
            for j in 0..<min(arr.count, brr.count){
                var char1 = arr[j]
                var char2 = brr[j]
                if char1 == char2{ continue }
                if map[char1] == nil{
                     map[char1] = Set<Character>()
                }
                if !map[char1, default: Set<Character>()].contains(char2){
                     map[char1]!.insert(char2)
                    degree[char2]! +=  1
                }
               
                break
            }
        }
        
        var queue = [Character]()
        for (key, value) in degree{
            if value == 0{
                queue.append(key)
            }
        }
        var res = ""
        while(queue.count > 0){
            var cur = queue.removeLast()
            res.append(cur)
            for neigh in map[cur, default: []]{
                degree[neigh]! -= 1
                if degree[neigh] == 0{ queue.append(neigh) }
            }
        }
        
        if res.count == degree.count{
            return res
        }
        return ""
    }
}