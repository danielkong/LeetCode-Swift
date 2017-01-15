// 459. Repeated Substring Pattern
// Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
// Solution: 	1. recursion. half
//				2. two pointer

// this solution get "Time Limit Exceeded"
    func repeatedSubstringPattern(_ str: String) -> Bool {
        let strLength = str.characters.count
        let midIdx = strLength/2
        if strLength == 1 {
            return false
        } else {
            // rotate str
            for i in 1...midIdx {
                let iIndex = str.index(str.startIndex, offsetBy: i)
                let newString = str.substring(from: iIndex) + str.substring(to: iIndex) 
                if newString == str {
                    return true
                }
            }
            return false
        }
    }
// Add if condition passed!
	func repeatedSubstringPattern(_ str: String) -> Bool {
        let strLength = str.characters.count
        let midIdx = strLength/2
        if strLength == 1 {
            return false
        } else {
            // rotate str
            for i in 1...midIdx {
                if strLength%i == 0 {
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