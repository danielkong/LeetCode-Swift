// 249. Group Shifted Strings
/**
Given a string, we can "shift" each of its letter to its successive letter, for example: "abc" -> "bcd". We can keep "shifting" which forms the sequence:

"abc" -> "bcd" -> ... -> "xyz"
Given a list of strings which contains only lowercase alphabets, group all strings that belong to the same shifting sequence.

For example, given: ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"], 
A solution is:

[
  ["abc","bcd","xyz"],
  ["az","ba"],
  ["acef"],
  ["a","z"]
]
*/
/** Note: 1. unicodeScalars expression
				- let chs = Array(str.characters)
				  (String(chs[0]).unicodeScalars.filter{ $0.isASCII }.first?.value)!

				- let unicodeScalars = Array(str.unicodeScalars)
				  unicodeScalars[0].value

		 2. UInt substract/add

		 3. print dict all values in an array
*/

// Solution 1 Swift basic by me:
class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {

        // Runtime: O(n*m) Space: O(m)
        var dict = [String: [String]]()

        for str in strings {
            var key = String(str.count)
            let chs = Array(str.characters)
            let ch0 = String(Array(str.characters)[0])
            // let asc = (ch0.unicodeScalars.filter{ $0.isASCII }.first?.value)!
            let asc = Int((ch0.unicodeScalars.filter{ $0.isASCII }.first?.value)!)

            for i in 1..<str.characters.count {
            	// Must convert to Int since UInt from 0 to 4,294,967,295
                // let asc2 = (chs[i].unicodeScalars.filter{ $0.isASCII }.first?.value)! 
                let asc2 = Int((chs[i].unicodeScalars.filter{ $0.isASCII }.first?.value)!)
                if asc2 - asc < 0 {
                    key.append(String(26+(asc2 - asc)))
                } else {
                    key.append(String(asc2 - asc))
                }
            }
            if dict[key] != nil {
                dict[key]!.append(str)
            } else {
                dict[key] = [str]
            }
        }
        
        // var res = [[String]]()
        // for k in dict.keys {
        //     res.append(dict[k]!)
        // }
        // return res
        return Array(dict.values) // equal to hidden lines
    }
}

// Solution 1 Neat & Enhanced:
class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        // 1. group length, each word calculate sequence 
        // 2. 
        // Runtime: O(n*m) Space: O(m)
        var dict = [String: [String]]()

        for str in strings {
            var key = String(str.count)
            let unicodeScalars = Array(str.unicodeScalars)
            let asc = Int(unicodeScalars[0].value)

            for i in 1..<str.unicodeScalars.count {
                let asc2 = Int(unicodeScalars[i].value)

                if asc2 - asc < 0 {
                    key.append(String(26+(asc2 - asc)))
                } else {
                    key.append(String(asc2 - asc))
                }
            }
            if dict[key] != nil {
                dict[key]!.append(str)
            } else {
                dict[key] = [str]
            }
        }

        return Array(dict.values)
    }
}

// Solution 2 Swift:

class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        var dict = [String:[String]]()
        
        for s in strings {
            let reducedS = reducedString(s)
            if var array = dict[reducedS] {
                array.append(s)
                dict[reducedS] = array
            } else {
                dict[reducedS] = [s]
            }
        }
        
        
        return Array(dict.values)
    }
    
    func reducedString(_ str: String) -> String {
        var arr = Array(str.unicodeScalars)
        let d = arr[0].value - UnicodeScalar("a").value
        
        var newArr = [UnicodeScalar]()
        
        for c in arr {
            newArr.append(UnicodeScalar((c.value + 26 - d) % 26)!)
        }
        
        return String(describing: newArr)
    }
}
