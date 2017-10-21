// 680. Valid Palindrome II
/**
	Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

	Example 1:
	Input: "aba"
	Output: True
	Example 2:
	Input: "abca"
	Output: True
	Explanation: You could delete the character 'c'.
	Note:
	The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
*/
class Solution {
    /**
    public boolean validPalindrome(String s) {
        int l = -1, r = s.length();
        while (++l < --r)
            if (s.charAt(l) != s.charAt(r)) return isPalindromic(s, l, r+1) || isPalindromic(s, l-1, r);
        return true;
    }

    public boolean isPalindromic(String s, int l, int r) {
        while (++l < --r)
            if (s.charAt(l) != s.charAt(r)) return false;
        return true;
    }
    */
    func validPalindrome(_ s: String) -> Bool {
        let sch = Array(s.characters)
        var l = 0, r = s.characters.count - 1
        while l < r {
            if sch[l] != sch[r] {
                return isPalindromic(sch, l+1, r) || isPalindromic(sch, l, r-1)
            }
            l += 1
            r -= 1
        }
        return true
    }

    func isPalindromic(_ sch: [Character], _ l: Int, _ r: Int) -> Bool {
        var l = l, r = r
        while l < r {
            if sch[l] != sch[r] {
                return false
            }
            l+=1
            r-=1
        }
        return true
    }
}
