// 14. Longest Common Prefix
// Write a function to find the longest common prefix string amongst an array of strings.
// Solution: 1. find shortest string and use hasPrefix
    func longestCommonPrefix(_ strs: [String]) -> String {
        var s: String?          //Find the shortest string
        var length = Int.max    //Shortest string's length
    
        for str in strs {
            if str.characters.count < length {
                length = str.characters.count
                s = str
            }
        }
        
        if var s = s {
            var endIndex = s.endIndex
            for str in strs {
                while !s.isEmpty && !str.hasPrefix(s) {
                    endIndex = s.index(before: endIndex)
                    s = s.substring(to: endIndex)
                }
            }
            return s
        } else {
            return ""
        }
    }