// 151. Reverse Words in a String
/**
Given an input string, reverse the string word by word.

For example,
Given s = "the sky is blue",
return "blue is sky the".

Update (2015-02-12):
For C programmers: Try to solve it in-place in O(1) space.
*/
// Native Method 
func reverseWordInString(_ str: String) -> String {
    let arr = str.components(separatedBy: " ").reversed()
    return arr.joined(separator: " ")
}
let res = reverseWordInString("the sky is blue") // "blue is sky the"
