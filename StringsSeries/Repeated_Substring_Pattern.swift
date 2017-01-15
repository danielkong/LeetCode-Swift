// 459. Repeated Substring Pattern
// Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.

// Solution: 	1. backtrack. runtime O(n^2)
//				2. KMP O(n)     http://www.geeksforgeeks.org/find-given-string-can-represented-substring-iterating-substring-n-times/

	func repeatedSubstringPattern(_ str: String) -> Bool {
        let strLength = str.characters.count
        let midIdx = strLength/2
        if strLength == 1 {
            return false
        } else {
            for i in 1...midIdx {
                if strLength%i == 0 { // get "Time Limit Exceeded" if no this line
                    let iIndex = str.index(str.startIndex, offsetBy: i)
                    let newString = str.substring(from: iIndex) + str.substring(to: iIndex) 
                    if newString == str {
                        return true
                    }
                }
            }
            return false
        }
    }
