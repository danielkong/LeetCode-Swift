// 680. Valid Palindrome II  easy
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
/**
    Solution: Greedy
    Time Complexity: O(N) -- Each of two checks of whether some substring is a palindrome is O(N)O(N).
    Space Complexity: O(1) -- pointer stored in mem.
*/

    func validPalindrome(_ s: String) -> Bool {
        let chs = Array(s)
        var left = 0, right = chs.count-1
        
        while left < right {
            if chs[left] != chs[right] {
                return isPalindrome(chs, left+1, right) || isPalindrome(chs, left, right-1)
            } else {
                left += 1
                right -= 1
            } 
        }

        return true
    }
    
    private func isPalindrome(_ chs:[Character], _ left: Int, _ right: Int) -> Bool {
        var left = left, right = right
        while left < right {
            if chs[left] != chs[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }