// 291. Word Pattern II
/**
Given a pattern and a string str, find if str follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty substring in str.

Examples:
pattern = "abab", str = "redblueredblue" should return true.
pattern = "aaaa", str = "asdasdasdasd" should return true.
pattern = "aabb", str = "xyzabcxzyabc" should return false.
Notes:
You may assume both pattern and str contains only lowercase letters.
*/


/** Time Complexity: 
In short:
    Hamiltonian cycle : O(N!) in the worst case
    WordBreak and StringSegment : O(2^N)
    NQueens : O(N!)
*/

class Solution {
    public var set = Set<String>()
    public var hashmap = Dictionary<Character, String>()

    func wordPatternMatch(_ pattern: String, _ str: String) -> Bool {
        return dfs(str, 0, pattern, 0)
    }

    func dfs(_ str: String, _ sindex: Int, _ pattern: String, _ pindex: Int) -> Bool {
        if sindex == str.count && pindex == pattern.count { return true }
        if sindex == str.count || pindex == pattern.count { return false }

        var pchs = Array(pattern.characters) // abab
        let schs = Array(str.characters) // redblueredblue

        let c = pchs[pindex]

        if hashmap[c] != nil {
            let s = hashmap[c]!


            if sindex+s.characters.count > schs.count { return false }
            if String(schs[sindex..<sindex+s.characters.count]) != s {
                return false

            }
            return dfs(str, sindex+s.count, pattern, pindex+1)
        }

        // pattern chs does not exist in map
        for i in sindex ..< str.characters.count {

            let p = String(schs[sindex..<i+1])
            if set.contains(p) {
                continue
            }

            hashmap[c] = p
            set.insert(p)

            if dfs(str, i+1, pattern, pindex+1) {
                return true
            }

            // backtracking
            hashmap.removeValue(forKey: c)
            set.remove(p)
        }

        return false
    }
}