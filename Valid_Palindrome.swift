// 125        Valid Palindrome        25.3%        Easy
/**
	Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

	For example,
	"A man, a plan, a canal: Panama" is a palindrome.
	"race a car" is not a palindrome.

	Note:
	Have you consider that the string might be empty? This is a good question to ask during an interview.

	For the purpose of this problem, we define empty string as valid palindrome.
*/
/**
https://instant.1point3acres.com/thread/169645/post/1868613
Palindrome, in place. no extra-space, 
*/

// Solution: 1. Two pointer.

    func isPalindrome(_ s: String) -> Bool {
        // Make String into an array of lowercase Characters
        let characters = s.lowercased().characters
        
        // Only keep alphanumeric characters.
        let cleaned = characters.filter { character in
            return character.description.rangeOfCharacter(from: CharacterSet.alphanumerics) != nil
        }
        
        // Compare values at mirroring indices.
        let total = cleaned.count
        for i in 0 ..< total/2 {
            if Array(cleaned)[i] != Array(cleaned)[total - 1 - i] {
                return false
            }
        }
        return true
    }

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var sch = [Character](s.characters)
        var i = 0
        var j = s.characters.count-1
        
        while i<j {
            if isValid(sch[i]) && isValid(sch[j]) {
                if String(sch[i]).lowercased() == String(sch[j]).lowercased() {
                    i += 1
                    j -= 1
                } else {
                    return false
                }
            } else {
                if !isValid(sch[i]) {
                    i += 1
                }
                if !isValid(sch[j]) {
                    j -= 1
                }
            }
        }
        
        return true
    }
    
    private func isValid(_ ch: Character) -> Bool {
        let s = String(ch).lowercased()
        
        for temp in s.unicodeScalars {
            if temp.isAlpha() {
                return true
            } else if temp.isDigit() {
                return true
            } 
        }

        return false
    }
}
// Java version
public static boolean isValidPalindrome(String s) {
	if(s==null || s.length()==0) return false;

	s = s.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
	System.out.println(s);

	for(int i = 0; i < s.length() ; i++){
		if(s.charAt(i) != s.charAt(s.length() - 1 - i)){
			return false;
		}
	}

	return true;
}
