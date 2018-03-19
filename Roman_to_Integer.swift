// 13. Roman to Integer  
/**
    Given a roman numeral, convert it to an integer.

    Input is guaranteed to be within the range from 1 to 3999.
*/
/**
 * Question Link: https://leetcode.com/problems/roman-to-integer/
 * Primary idea: Iterate through end to start, add or minus according to different situations
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */
 // from small to big

class Solution {
    /**
    Symbol  I   V   X   L   C   D   M
    Value   1   5   10  50  100 500 1,000
    */
    /**
    func charToNum(_ c: Character) -> Int {
        switch(c) {
            case "M":
            return 1000
            case "D":
            return 500
            case "C":
            return 100
            case "L":
            return 50
            case "X":
            return 10
            case "V":
            return 5
            case "I":
            return 1
            default:
            return 0
        }
    }
    */
    func romanToInt(_ s: String) -> Int {  
        let dict: [Character: Int] = {
            var dict = [Character: Int]()
            dict["I"] = 1
            dict["V"] = 5
            dict["X"] = 10
            dict["L"] = 50
            dict["C"] = 100
            dict["D"] = 500
            dict["M"] = 1000
            return dict
        }()
        var prev = 0
        var res = 0
        
        for c in s.characters.reversed() {
            var val = dict[c]!
            
            if val < prev {
                res -= val                
            } else {
                res += val
                prev = val
            }
                        
        }
        return res
    }
}