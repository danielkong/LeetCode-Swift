// 269        Alien Dictionary         22.4%        Hard        
/**
Problem Description:

There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.

For example,
Given the following words in dictionary,

[
  "wrt",
  "wrf",
  "er",
  "ett",
  "rftt"
]
The correct order is: "wertf".

Note:

You may assume all letters are in lowercase.
If the order is invalid, return an empty string.
There may be multiple valid order of letters, return any one of them is fine.
*/

/**
 * Primary idea: Topological sort, keep each character for a inDegree number and 
 *               to characters list, use a queue to decrease inDegree and form the result
 *
 * Time Complexity: O(nm), Space Complexity: O(m), 
 * n represents words number, m represents length of a word
 */
class AlienDictionary {
    var inDegrees = [Character: Int]()
    var toWords = [Character: [Character]]()
    var valid = true

    func alienOrder(_ words: [String]) -> String {
        var res = "", qChars = [Character]()
    
        guard words.count > 0 else {
            return res
        }
        
        initGraph(words)
        
        for char in inDegrees.keys {
            if inDegrees[char] == 0 {
                qChars.append(char)
            }
        }
        
        while !qChars.isEmpty {
            let char = qChars.removeFirst()
            res += String(char)
            
            guard let toChars = toWords[char] else {
                continue
            }
            
            for c in toChars {
                inDegrees[c]! -= 1
                if inDegrees[c] == 0 {
                    qChars.append(c)
                }
            }
        }
        
        return res.characters.count == inDegrees.count && valid ? res : ""
    }
    
    private func initGraph(_ words: [String]) {
        for word in words {
            for char in word.characters {
                inDegrees[char] = 0
            }    
        }
        
        for i in 0 ..< words.count - 1 {
            let prev = Array(words[i].characters)
            let post = Array(words[i + 1].characters)
            var j = 0
            
            while j < prev.count && j < post.count {
                if prev[j] == post[j] {
                    j += 1
                } else {
                    addEdge(prev[j], post[j])
                    break
                }
            } 
            
            if prev.count != post.count && j == post.count {
                valid = false
            }
        }
    }
    
    private func addEdge(_ from: Character, _ to: Character) {
        if let inDegree = inDegrees[to] {
            inDegrees[to] = inDegree + 1
        }
        
        if toWords[from] != nil {
            toWords[from]!.append(to)
        } else {
            toWords[from] = [to]
        }
    }
}

// Solution 2: python
/**
Two similar solutions. Both first go through the word list to find letter pairs (a, b) where a must come before b in the alien alphabet. The first solution just works with these pairs, the second is a bit smarter and uses successor/predecessor sets. Doesn't make a big difference here, though, I got both accepted in 48 ms.

Solution 1

def alienOrder(self, words):
    less = []
    for pair in zip(words, words[1:]):
        for a, b in zip(*pair):
            if a != b:
                less += a + b,
                break
    chars = set(''.join(words))
    order = []
    while less:
        free = chars - set(zip(*less)[1])
        if not free:
            return ''
        order += free
        less = filter(free.isdisjoint, less)
        chars -= free
    return ''.join(order + list(chars))
Solution 2

def alienOrder(self, words):
    pre, suc = collections.defaultdict(set), collections.defaultdict(set)
    for pair in zip(words, words[1:]):
        for a, b in zip(*pair):
            if a != b:
                suc[a].add(b)
                pre[b].add(a)
                break
    chars = set(''.join(words))
    free = chars - set(pre)
    order = ''
    while free:
        a = free.pop()
        order += a
        for b in suc[a]:
            pre[b].discard(a)
            if not pre[b]:
                free.add(b)
    return order * (set(order) == chars)
*/

