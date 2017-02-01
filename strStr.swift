// Implement strStr().
// 
// Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
/**
 * Question Link: https://leetcode.com/problems/implement-strstr/
 * Primary idea: Iterate two strings
 * Time Complexity: O(nm), Space Complexity: O(n)
 */

class StrStr {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hChars = Array(haystack.characters), nChars = Array(needle.characters)
        let hLen = hChars.count, nLen = nChars.count
    
        guard hLen >= nLen else {
            return -1
        }
        guard nLen != 0 else {
            return 0
        }
        
        for i in 0 ... hLen - nLen {
        	var j = 0
            if hChars[i] == nChars[j] {
                while j < nLen {
                	if hChars[i+j] == nChars[j] {
                		j += 1
                	} else {
                		break
                	}
                }
                if j == nLen {
                    return i
                }
            } 
        }
        
        return -1
    }
}