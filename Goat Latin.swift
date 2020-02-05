// 824. Goat Latin  Easy

/**
A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.

We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

The rules of Goat Latin are as follows:

If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
For example, the word 'apple' becomes 'applema'.
 
If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
For example, the word "goat" becomes "oatgma".
 
Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
Return the final sentence representing the conversion from S to Goat Latin. 

 

Example 1:

Input: "I speak Goat Latin"
Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
Example 2:

Input: "The quick brown fox jumped over the lazy dog"
Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
 

Notes:

S contains only uppercase, lowercase and spaces. Exactly one space between each word.
1 <= S.length <= 150.
*/
class Solution {
    func toGoatLatin(_ S: String) -> String {
        // var strings = split(S) { $0 == " " }   
        var strings = S.components(separatedBy: " ")
        guard strings.count > 0 else {
            return ""
        }
        
        for i in 0..<strings.count {
            strings[i] = conversion(strings[i], i+1)
        }
        return strings.joined(separator: " ")
    }
    
    func conversion(_ s:String, _ index: Int) -> String {
        var res = ""
        switch s.prefix(1) {
            case "a", "e", "i", "o", "u","A", "E", "I", "O", "U": 
                res = s+"ma"
            default:
                let first = String(s.prefix(1))
                res = String(s.dropFirst(1)) + first + "ma"
        }
        var app = ""
        for i in 0..<index {
            app.append("a")
        }
        return res+app
    }
}


class Solution {
    func toGoatLatin(_ S: String) -> String {
        var index = 0
        var words = S.split(separator: " ")
        print(words)
        var retStr = ""
        
        for word in words {
            let char = convert(word: String(word), index: index)
            print(char)
            
            retStr.append(char)
            retStr.append(" ")
            index += 1
        }

        retStr.removeLast()
        
        return retStr
    }
    
    func convert(word: String, index: Int) -> String {
        let vowels: Set = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    
        let wordArray = Array(word)
        var retWord = word

        if !vowels.contains(String(wordArray[0])) {
            let character = retWord.removeFirst()
            retWord.append(character)
        }
    
        retWord.append("ma")
    
        for _ in 0...index {
            retWord.append("a")
        }
    
        return retWord
    }
}