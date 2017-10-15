// 10        Regular Expression Matching        23.5%        Hard
/**
Implement regular expression matching with support for '.' and '*'.

'.' Matches any single character.
'*' Matches zero or more of the preceding element.

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "a*") → true
isMatch("aa", ".*") → true
isMatch("ab", ".*") → true
isMatch("aab", "c*a*b") → true

Notice: Different than Wildcard Matching
*/

// Solution 2 : Swift - easy understand but longest AC
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var input: [Character] = Array(s.characters)
        var pattern: [Character] = Array(p.characters)
        pattern.append(" ")
        return isMatch(&input, 0, &pattern, 0)
    }

    func isMatch(_ s: inout [Character], _ indexS: Int, _ p: inout [Character], _ indexP: Int) -> Bool {
        //base case
        if p.count - indexP <= 1 {
            return s.count - indexS == 0
        }

        let allowedCharIsOptional = p[indexP+1] == "*"

        //deal with non-optional case
        if allowedCharIsOptional == false {
            //must match

            return indexS < s.count
                && (s[indexS] == p[indexP] || p[indexP] == ".")
                && isMatch(&s, indexS+1, &p, indexP+1)

        }

        //deal with optional case

        var localIndexS = indexS
        while (localIndexS < s.count && (s[localIndexS] == p[indexP] || p[indexP] == ".") )
        {
            if isMatch(&s, localIndexS, &p, indexP+2) { return true }
            localIndexS += 1
        }

        return isMatch(&s, localIndexS, &p, indexP+2)

    }
}


// Fast on Leetcode Solution: Swift

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        guard !p.isEmpty else {
            return s.isEmpty
        }

        var string = Array(s.characters)
        var pattern = Array(p.characters)

        var isPossibleMatch = [[Bool]](repeating: [Bool](repeating: true, count: string.count+1), count: pattern.count+1)

        return isMatch(
                string: string,
                stringIndex: 0,
                pattern: pattern,
                patternIndex: 0,
                isPossibleMatch: &isPossibleMatch)
    }

    func isMatch(
        string: [Character],
        stringIndex: Int,
        pattern: [Character],
        patternIndex: Int,
        isPossibleMatch: inout [[Bool]]
    ) -> Bool {
        guard patternIndex < pattern.count else {
            return stringIndex == string.count
        }

        guard isPossibleMatch[patternIndex][stringIndex] else {
            return false
        }

        if patternIndex+1 < pattern.count && pattern[patternIndex+1] == "*" {

            if isMatch(
                string: string,
                stringIndex: stringIndex,
                pattern: pattern,
                patternIndex: patternIndex+2,
                isPossibleMatch: &isPossibleMatch
            ) {
                return true
            }

            if stringIndex < string.count && (pattern[patternIndex] == "." || pattern[patternIndex] == string[stringIndex]) {
                if isMatch(
                    string: string,
                    stringIndex: stringIndex+1,
                    pattern: pattern,
                    patternIndex: patternIndex,
                    isPossibleMatch: &isPossibleMatch
                ) {
                    return true
                }
            }

        } else if stringIndex < string.count { // "." or "a"

             if pattern[patternIndex] == "." || pattern[patternIndex] == string[stringIndex] {

                if isMatch(
                    string: string,
                    stringIndex: stringIndex+1,
                    pattern: pattern,
                    patternIndex: patternIndex+1,
                    isPossibleMatch: &isPossibleMatch
                ) {
                    return true
                }
            }
        }

        isPossibleMatch[patternIndex][stringIndex] = false
        return false
    }
}

// http://articles.leetcode.com/regular-expression-matching
bool isMatch(const char *s, const char *p) {
  assert(s && p);
  if (*p == '\0') return *s == '\0';

  // next char is not '*': must match current character
  if (*(p+1) != '*') {
    assert(*p != '*');
    return ((*p == *s) || (*p == '.' && *s != '\0')) && isMatch(s+1, p+1);
  }
  // next char is '*'
  while ((*p == *s) || (*p == '.' && *s != '\0')) {
    if (isMatch(s, p+2)) return true;
    s++;
  }
  return isMatch(s, p+2);
}

// Dynamic Programming

class Solution {
public:
    bool isMatch(string s, string p) {
        // dynamic programming
        int m=s.length(), n = p.length();
        vector<vector<bool>> dp (m+1, vector<bool> (n+1, false));
        // initial state
        dp[0][0] = true;
        for(int i = 0; i < m+1; i++) {
            for(int j = 1; j < n+1; j++) {
                if(p[j-1] != '*') {
                    dp[i][j] = i > 0 && dp[i-1][j-1] && (s[i-1] == p[j-1] || p[j-1] == '.');
                }
                else {
                    dp[i][j] = dp[i][j-2] || (i > 0 && dp[i-1][j] && (s[i-1] == p[j-2] || p[j-2] == '.'));
                }
            }
        }
        return dp[m][n];
    }
};
