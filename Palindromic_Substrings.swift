// 647. Palindromic Substrings
/**
Given a string, your task is to count how many palindromic substrings in this string.

The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

	Example 1:
	Input: "abc"
	Output: 3
	Explanation: Three palindromic strings: "a", "b", "c".
	Example 2:
	Input: "aaa"
	Output: 6
	Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
	Note:
	The input string length won't exceed 1000.

*/

/**
	Idea: for loop, and consider each one as center of substring, check substring is palidome or not. 
			Two case need consider. Odd, and Even.
	Runtime: O(N*N/2) = O(N^2)
	Space complexity: O(1)
*/

    func countSubstrings(_ s: String) -> Int {
        var str: [Character] = [Character](s)
        var answer: Int = 0
        var templ = 0, tempr = 0
        for i in 0...str.count - 1 {
            templ = i
            tempr = i
            answer += 1
            // check even
            while tempr < str.count - 1 && str[i] == str[tempr + 1] {
                tempr += 1
                answer += 1
            }
            // check odd
            while templ > 0 && tempr < str.count - 1 && str[templ - 1] == str[tempr + 1] {
                templ -= 1
                tempr += 1
                answer += 1
            }
        }
        return answer
    }

    