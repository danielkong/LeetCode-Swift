// 76        Minimum Window Substring        23.8%        Hard        
/**
Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

For example,
S = "ADOBECODEBANC"
T = "ABC"
Minimum window is "BANC".

Note:
If there is no such window in S that covers all characters in T, return the empty string "".

If there are multiple such windows, you are guaranteed that there will always be only one unique minimum window in S.
*/

// Solution: Swift. 
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // hash table - key: letter value: appear count
        let tChars = Array(t.characters)
        let tLen = t.characters.count
        
        let sLen = s.characters.count
        let sChars = Array(s.characters)
        
        if sLen == 0 || tLen == 0 {
            return ""
        }
        
        var targetHash = Dictionary<Character, Int>()
        for ch in tChars {
            if targetHash[ch] != nil {
                targetHash[ch]! += 1
            } else {
                targetHash[ch] = 1
            }
        }
        
        var left = 0
        var found = 0
        
        var begin = 0
        var minLength = sLen + 1
        
        for (right, sch) in sChars.enumerated() {
            if targetHash[sch] != nil {
                targetHash[sch]! -= 1
                if targetHash[sch]! >= 0 {
                    found += 1
                }
                while found == tLen {
                    if right - left + 1 < minLength {
                        minLength = right - left + 1
                        begin = left
                    }

                    if targetHash[sChars[left]] != nil {
                        targetHash[sChars[left]]! += 1
                        if targetHash[sChars[left]]! > 0 {
                            found -= 1
                        }
                    }
                    left += 1
                }
            }
        }

        if minLength == sLen + 1 { return "" }
        let startIdx = s.index(s.startIndex, offsetBy: begin)
        let endIdx = s.index(s.startIndex, offsetBy: begin+minLength)
        let range = startIdx..<endIdx
        return s.substring(with: range)
    }
}

// Swift: other people
/**
 * Question Link: https://leetcode.com/problems/minimum-window-substring/
 * Primary idea: Use dictionary and int to verify if contain all characters, and update 
 *               startIndex and miniWindow as well
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 *
 */

class MinimumWindowSubstring {
    func minWindow(_ s: String, _ t: String) -> String {
        let sChars = Array(s.characters)
        let sLen = sChars.count
        let tLen = t.characters.count
    
        guard sLen >= tLen else {
            return ""
        }
    
        var freqencyDict = calcCharFrec(t)
        var startIndex = 0
        var minLen = Int.max
        var count = 0
        var res = ""
        
        for (i, current) in sChars.enumerated() {
            guard freqencyDict[current] != nil else {
                continue
            }
            
            // update freqency dictionary
            freqencyDict[current]! -= 1
            if freqencyDict[current]! >= 0 {
                count += 1
            }
            
            // update startIndex
            while count == tLen {
                let startChar = sChars[startIndex]
            
                guard freqencyDict[startChar] != nil else {
                    startIndex += 1
                    continue
                }
                
                freqencyDict[startChar]! += 1
                if freqencyDict[startChar]! > 0 {
                    // update res
                    if i - startIndex + 1 < minLen {
                        res = String(sChars[startIndex ... i])
                        minLen = i - startIndex + 1
                    }
                    count -= 1
                }
                startIndex += 1
            }
        }
        
        return res
    }
    
    private func calcCharFrec(_ t: String) -> [Character: Int] {
        var dict = [Character: Int]()
    
        for char in t.characters {
            if let freq = dict[char] {
                dict[char] = freq + 1
            } else {
                dict[char] = 1
            }
        }
        
        return dict
    }
}
// Java:
    public String minWindow(String S, String T) {
        int[] srcHash = new int[255];
        // 记录目标字符串每个字母出现次数
        for(int i = 0; i < T.length(); i++){
            srcHash[T.charAt(i)]++;
        }
        int start = 0,i= 0;
        // 用于记录窗口内每个字母出现次数 
        int[] destHash = new int[255];
        int found = 0;
        int begin = -1, end = S.length(), minLength = S.length();
        for(start = i = 0; i < S.length(); i++){
            // 每来一个字符给它的出现次数加1
            destHash[S.charAt(i)]++;
            // 如果加1后这个字符的数量不超过目标串中该字符的数量，则找到了一个匹配字符
            if(destHash[S.charAt(i)] <= srcHash[S.charAt(i)]) found++;
            // 如果找到的匹配字符数等于目标串长度，说明找到了一个符合要求的子串    
            if(found == T.length()){
                // 将开头没用的都跳过，没用是指该字符出现次数超过了目标串中出现的次数，并把它们出现次数都减1
                while(start < i && destHash[S.charAt(start)] > srcHash[S.charAt(start)]){
                    destHash[S.charAt(start)]--;
                    start++;
                }
                // 这时候start指向该子串开头的字母，判断该子串长度
                if(i - start < minLength){
                    minLength = i - start;
                    begin = start;
                    end = i;
                }
                // 把开头的这个匹配字符跳过，并将匹配字符数减1
                destHash[S.charAt(start)]--;
                found--;
                // 子串起始位置加1，我们开始看下一个子串了
                start++;
            }
        }
        // 如果begin没有修改过，返回空
        return begin == -1 ? "" : S.substring(begin,end + 1);
    }


    // 