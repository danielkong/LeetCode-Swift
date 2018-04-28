// Implement strStr().
// 
// Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

/**
    Idea: Straight Forward: Check first char same, then compare rest
    Runtime: O(MN)
    Space: O(N)
*/
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        var hch = Array(haystack)
        var nch = Array(needle)
        if needle.count == 0 { return 0 }
        for i in 0...(haystack.count-needle.count) {
            if hch[i] == nch[0] {
                var same = true
                for j in 1..<nch.count {
                    if hch[i+j] != nch[j] {
                        same = false
                        break
                    }
                }
                if same { return i }
            }
        }
        return -1
    }
}

/**
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