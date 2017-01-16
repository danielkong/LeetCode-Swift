// 345. Reverse Vowels of a String
// Write a function that takes a string as input and reverse only the vowels of a string.
//
// Example 1:
// Given s = "hello", return "holle".
//
// Example 2:
// Given s = "leetcode", return "leotcede".

// Solution: 1. vowel store in array O(n) space 
			 2. two pointer
//	Note: Upper case, case sensitive.

//	time limit exceeded (failed on big data)
//	time complexity: O(n), space complexity: O(n)
    func reverseVowels(_ s: String) -> String {
        var vowels = [Character]()
        let vowelSet = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        for ch in s.characters {
            if vowelSet.contains(String(ch)) {
                vowels.append(ch)
            }
        }
        var res = ""
        if vowels.count == 0 {
            return s
        }
        for ch in s.characters {
            if vowelSet.contains(String(ch)) {
                res.append(vowels.last!)
                vowels.removeLast()
            } else {
                res.append(ch)
            }
        }
        return res
    }

//	time complexity: O(n), space complexity: O(1) 
//	Runtime: 338 ms beats 75%
	func reverseVowels(s: String) -> String {
	    // Create a set for vowels.
	    let vowels: Set<Character> = ["a","e","i","o","u","A","E","I","O","U"]

	    // Convert input string to array so that we can write into it.
	    var result = Array(s.characters)

	    var i = 0
	    var j = result.count - 1
	    while i < j {
	        if !vowels.contains(result[i]) {
	            i += 1
	        }
	        else if !vowels.contains(result[j]) {
	            j -= 1
	        }
	        else {
	            // Both are vowels.
	            let temp = result[i]
	            result[i] = result[j]
	            result[j] = temp
	            i += 1
	            j -= 1
	        }
	    }
	    return String(result)
	}