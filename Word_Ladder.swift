// Word Ladder
/**
Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:

Only one letter can be changed at a time.
Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
For example,

Given:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log","cog"]
As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.

Note:
Return 0 if there is no such transformation sequence.
All words have the same length.
All words contain only lowercase alphabetic characters.
You may assume no duplicates in the word list.
You may assume beginWord and endWord are non-empty and are not the same.
*/

/**
 Idea:  1. BFS -- find shortest path
        2. bi-direction BFS
 Runtime:   O(N * word.len * 26)
 Space:     O(N)
 */

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    guard wordList.contains(endWord) else { return 0 }
    var beginSet = Set<String>(), endSet = Set<String>()
    var res = 1
    var visited = Set<String>()
    
    beginSet.insert(beginWord)
    endSet.insert(endWord)
    
    while !beginSet.isEmpty && !endSet.isEmpty {
        if beginSet.count > endSet.count {
            (beginSet, endSet) = (endSet, beginSet)
        }
        
        var tempSet = Set<String>()
        for word in beginSet {
            for (idx,ch) in Array(word).enumerated() {
                var temp = Array(word)
                for c in "abcdefghijklmnopqrstuvwxyz" { // for i in "a".utf16[0]…"z".utf16[0] { ... }
                    temp[idx] = c
                    let tempStr = String(temp)
                    if endSet.contains(tempStr) {
                        return res+1
                    }
                    
                    if !visited.contains(tempStr) && wordList.contains(tempStr) {
                        tempSet.insert(tempStr)
                        visited.insert(tempStr)
                    }
                }
            }
        }
        
        beginSet = tempSet
        res += 1
    }
    return 0
}


class Solution {
// in java, public int ladderLength(String beginWord, String endWord, Set<String> wordList) {}
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard beginWord != endWord else {
            return 0
        }
        
        var beginSet = Set([beginWord])
        var endSet = Set([endWord])
        
        var len = 1
        let strLen = beginWord.characters.count
        var visited = Set<String>()
        
        while !beginSet.isEmpty && !endSet.isEmpty {
            // enhance algor
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            
            var temp = Set<String>()
            for word in beginSet {
                var chars = Array(word.characters)
                
                for i in 0..<chars.count {
                    for ch in Array("abcdefghijklmnopqrstuvwxyz".characters) {
                        let oldChar = chars[i]
                        chars[i] = ch
                        let target = String(chars)
                        if endSet.contains(target) && wordList.contains(target) {
                            print(target)
                            return len + 1
                        }
                        
                        if !visited.contains(target) && wordList.contains(target) {
                            temp.insert(target)
                            visited.insert(target)
                        }
                        
                        chars[i] = oldChar
                    }
                }
            }
            
            beginSet = temp
            len += 1
        }
        
        return 0
    }
    
    private func swap(_ set1: inout Set<String>, _ set2: inout Set<String>) {
        let temp = set1
        set1 = set2
        set2 = temp
    }
}

/**
这道题是套用BFS同时也利用BFS能寻找最短路径的特性来解决问题。

 把每个单词作为一个node进行BFS。当取得当前字符串时，对他的每一位字符进行从a~z的替换，如果在字典里面，就入队，并将下层count++，并且为了避免环路，需把在字典里检测到的单词从字典里删除。这样对于当前字符串的每一位字符安装a~z替换后，在queue中的单词就作为下一层需要遍历的单词了。

 正因为BFS能够把一层所有可能性都遍历了，所以就保证了一旦找到一个单词equals（end），那么return的路径肯定是最短的。
*/
// use one queue, solve this problem, need to use currentLevelCount, nextLevelCount to handle level
// use two queue, solve this problem, currentQueue and nextQueue

public int ladderLength(String start, String end, HashSet<String> dict) {
        if(start==null || end==null || start.length()==0 || end.length()==0 || start.length()!=end.length())  
        return 0; 
        
        LinkedList<String> wordQueue = new LinkedList<String>();
        int level = 1; //the start string already count for 1
        int curnum = 1;//the candidate num on current level
        int nextnum = 0;//counter for next level
        
        wordQueue.add(start);
        
        while(!wordQueue.isEmpty()){
            String word = wordQueue.poll();
            curnum--;
            
            char[] wordunit = word.toCharArray();
            for(int i = 0; i < word.length(); i++){
                for(char j = 'a'; j <= 'z'; j++){
                    wordunit[i] = j;
                    String temp = new String(wordunit);  
                    
                    if(temp.equals(end))
                        return level+1;
                    if(dict.contains(temp)){
                        wordQueue.add(temp);
                        nextnum++;
                        dict.remove(temp);
                    }
                }
            }
            
            if(curnum == 0){
                curnum = nextnum;
                nextnum = 0;
                level++;
            }
        }
        
        return 0;
    }
