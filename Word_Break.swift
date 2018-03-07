// 139 Word Break 

/**
Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words. You may assume the dictionary does not contain duplicate words.

For example, given
s = "leetcode",
dict = ["leet", "code"].

Return true because "leetcode" can be segmented as "leet code".
*/

// First, trying to use greedy solution, but it failed on "aaaaaaa", "aaa", "aaaa"
// It seems need add another for loop outside, like back tracking solution.
// DP -- Use an arry save temp
// runtime: time = O(n^2); space = O(n)
// There is 2nd solution at bottom. DFS. time = O(n!); space = O(1) like back-tracking

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    // back-tracking whether index could reach s.characters.count
    let sch = Array(s.characters)
    var temp = Array(repeating: false, count: s.characters.count+1)
    temp[0] = true
    
    for i in 1...s.characters.count {
        for j in 0..<i {
            if temp[j] && wordDict.contains(String(sch[j..<i])) {
                temp[i] = true
                break
            }
        }
    }
    return temp[s.characters.count]
}
// Java Solution:
public class Solution {
    public boolean wordBreak(String s, Set<String> dict) {
        
        boolean[] f = new boolean[s.length() + 1];
        
        f[0] = true;
        
        
        /* First DP
        for(int i = 1; i <= s.length(); i++){
            for(String str: dict){
                if(str.length() <= i){
                    if(f[i - str.length()]){
                        if(s.substring(i-str.length(), i).equals(str)){
                            f[i] = true;
                            break;
                        }
                    }
                }
            }
        }*/
        
        //Second DP
        for(int i=1; i <= s.length(); i++){
            for(int j=0; j < i; j++){
                if(f[j] && dict.contains(s.substring(j, i))){
                    f[i] = true;
                    break;
                }
            }
        }
        
        return f[s.length()];
    }
}

class Solution {
    /*
     OK: DP -
     https://discuss.leetcode.com/topic/7299/c-dynamic-programming-simple-and-fast-solution-4ms-with-optimization
     https://discuss.leetcode.com/topic/6156/java-implementation-using-dp-in-two-ways
     */
    /*
     Solution1. DP. time = O(n^2); space = O(n) - DP array
     dp[i] is set to true if a valid word (word sequence) ends there
     The optimization is to look from current position i back and only substring and do dictionary look up in case the preceding position j with dp[j] == true is found.
     */
    func wordBreak1(_ s: String, _ wordDict: [String]) -> Bool {
        let n = s.characters.count
        let dict = Set<String>(wordDict) //O(n)
        var f = [Bool](repeating: false, count: n + 1)
        f[0] = true
        
        for i in 1 ..< n + 1 {
            for j in 0 ..< i {
                if f[j] && dict.contains(s.subString(j, i)) {
                    f[i] = true
                    break
                }
            }
        }
        return f[n]
    }
    
    /*
     Solution2. DFS. time = O(n!); space = O(1)
     */
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.characters.count > 0 else {
            return wordDict.count == 0
        }
        var wordSet = Set<String>(wordDict)
        return DFS(s, &wordSet)
    }
    private func DFS(_ s: String, _ wordSet: inout Set<String>) -> Bool {
        if s.characters.count == 0 {// Termination case
            return true
        }
        for str in wordSet {
            if s.hasPrefix(str) {// Prefix: matchs word in wordList. <-- O(mn)
                wordSet.remove(str)// 1) remove it from wordList
                if DFS(s.replacingOccurrences(of: str, with: ""), &wordSet) {// 2) remove word from s, then keep DFS
                    return true
                }
                //wordSet.insert(str)
            }
        }
        return false
    }
}

extension String {
    func subString (_ start: Int, _ end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        let subString = self[startIndex..<endIndex]
        return String(subString)
}
