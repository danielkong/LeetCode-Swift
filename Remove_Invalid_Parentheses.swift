// 301. Remove Invalid Parentheses
// Remove the minimum number of invalid parentheses in order to make the input string valid. 
// Return all possible results.
// Note: The input string may contain letters other than the parentheses ( and )
//	"()())()" -> ["()()()", "(())()"]
//	"(a)())()" -> ["(a)()()", "(a())()"]
//	")(" -> [""]`


/**
 * Question Link: https://leetcode.com/problems/remove-invalid-parentheses/
 * Primary idea: Remove ) when the string is invalid, add to result when string is valid,
 *               and do the same thing for the reversed one
 *
 * Time Complexity: O(n!), Space Complexity: O(n)
 *
 */

class Solution {
    
    var result = [String]()
    
    func removeInvalidParentheses(_ s: String) -> [String] {
        helper(Array(s.characters), 0, 0, (Character("("), Character(")")))
        return result
    }
    
    func helper(_ sArray: [Character], _ checkStart: Int, _ removeStart: Int, _ parentheses: (first: Character, second: Character)) {
        
        var count = 0
        
        for i in checkStart..<sArray.count {
            let char = sArray[i]
            if char == parentheses.first {
                count += 1
            }
            if char == parentheses.second {
                count -= 1
            }
            
            if count < 0 {
                for j in removeStart...i {
                    if sArray[j] == parentheses.second && (j == removeStart || sArray[j-1] != parentheses.second) {
                        helper(Array(sArray[0..<j] + sArray[j+1..<sArray.count]), i, j, parentheses)
                    }
                }
                return
            }
        }
        
        if parentheses.first == "(" {
            helper(sArray.reversed(), 0, 0, (parentheses.second, parentheses.first))
        } else {
            result.append(String(sArray.reversed()))
        }
    }
}
