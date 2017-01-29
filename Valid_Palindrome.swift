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

// Solution: 1. Two pointer.

func isPalindrome(_ str: String) -> Bool {
    if str.lowercased().characters.count == 0 {
        return true
    }
    var i = 0
    var j = str.characters.count-1
    print(j)
    let temp = Array(str.lowercased().characters)
    while i < j {
        if (temp[i] <= "a" || temp[i] >= "z") {
            i+=1
        }
        if (temp[j] <= "a" || temp[j] >= "z") {
            j-=1
        }
        if temp[i] != temp[j] {
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