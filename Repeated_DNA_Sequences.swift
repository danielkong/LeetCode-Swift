// 187. Repeated DNA Sequences
/**
All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.

Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.

Example:

Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"

Output: ["AAAAACCCCC", "CCCCCAAAAA"]
*/
/**
    Idea: Using HashMap store all possible 10 character as key, and times as value
    Runtime: O(N)
    
*/
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else { return [] }
        var dict = [String: Int]()
        let len = s.count
        let sch = Array(s)
        
        for i in 0 ... len-10 {
            let temp = String(sch[i..<(i+10)])
            if dict[temp] != nil {
                dict[temp]! += 1
            } else {
                dict[temp] = 1
            }
        }
        var res = [String]()
        for key in dict.keys {
            if dict[key]! > 1 {
                res.append(key)
            }
        }
        return res
    }
}