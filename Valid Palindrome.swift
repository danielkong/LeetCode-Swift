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

// Solution: Two pointer.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chs = Array(s.lowercased())
        var i = 0
        var j = chs.count-1
        while i < j {
            let ilowercased = chs[i]
            let jlowercased = chs[j]
            if !ilowercased.isValid && i<j {
                i+=1
                continue
            }
            if !jlowercased.isValid && i<j {
                j-=1
                continue
            }
            if ilowercased == jlowercased {
                i+=1
                j-=1
            } else {
                return false
            }
        }
        return true
    }
}

extension Character {
    var isValid: Bool {
        return isLetter || isNumber
    }
}

// Solution 2

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
