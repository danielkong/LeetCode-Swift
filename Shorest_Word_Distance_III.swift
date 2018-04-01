// 245. Shorest WOrd Distance III

/**
This is a follow up of Shortest Word Distance. The only difference is now word1 could be the same as word2.

Given a list of words and two words word1 and word2, return the shortest distance between these two words in the list.

word1 and word2 may be the same and they represent two individual words in the list.

For example,
Assume that words = ["practice", "makes", "perfect", "coding", "makes"].

Given word1 = “makes”, word2 = “coding”, return 1.
Given word1 = "makes", word2 = "makes", return 3.

Note:
You may assume word1 and word2 are both in the list.
*/

// Use dictionary store index, Runtime: O(N) + O(pq) // p count of word1, q coutn of word2

class Solution {
    func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var dict = [String : [Int]]()
        for (idx, word) in words.enumerated() {
            if dict[word] != nil {
                var test = dict[word]!
                test.append(idx)
                dict[word] = test
            } else {
                dict[word] = [idx]
            }
        }
        
        let arrayIdx1 = dict[word1] as! [Int]
        let arrayIdx2 = dict[word2] as! [Int]
        
        var res = Int.max
        if word1 == word2 {
            for i in 0..<arrayIdx1.count-1 {
                res = min(res, abs(arrayIdx1[i] - arrayIdx1[i+1]))
            }
        } else {
            for idx1 in arrayIdx1 {
                for idx2 in arrayIdx2 {
                    res = min(res, abs(idx1 - idx2))
                }
            }
        }
        
        return res
    }
}

class Solution {
    func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var dict = [String: [Int]]()
        for (i, word) in words.enumerated() {
            if dict[word] == nil {
                dict[word] = [i]
            } else {
                dict[word]!.append(i)
            }
        }
        
        var res = Int.max
        if word1 == word2 {
            if let aidx = dict[word1] {
                for i in 0...aidx.count-2 {
                    res = min(res, abs(aidx[i]-aidx[i+1]))
                }
            }
        } else {
            if let aidx = dict[word1], let bidx = dict[word2] {
                for a in aidx {
                    for b in bidx {
                        res = min(res, abs(a-b))
                    }
                }
            }
        }
        
        
        return res
    }
}

/**
public:
    int shortestWordDistance(vector<string>& words, string word1, string word2) {
        int p1 = -1, p2 = -1, res = INT_MAX;
        for (int i = 0; i < words.size(); ++i) {
            int t = p1;
            if (words[i] == word1) p1 = i;
            if (words[i] == word2) p2 = i;
            if (p1 != -1 && p2 != -1) {
                if (word1 == word2 && t != -1 && t != p1) {
                    res = min(res, abs(t - p1));
                } else if (p1 != p2) {
                    res = min(res, abs(p1 - p2));
                }
            }
        }
        return res;
    }
};
 */
