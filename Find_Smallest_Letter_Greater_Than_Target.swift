// 744. Find Smallest Letter Greater Than Target
/**
Given a list of sorted characters letters containing only lowercase letters, and given a target letter target, find the smallest element in the list that is larger than the given target.

Letters also wrap around. For example, if the target is target = 'z' and letters = ['a', 'b'], the answer is 'a'.

Examples:
	Input:
		letters = ["c", "f", "j"]
		target = "a"
		Output: "c"

	Input:
		letters = ["c", "f", "j"]
		target = "c"
		Output: "f"

	Input:
		letters = ["c", "f", "j"]
		target = "d"
		Output: "f"

	Input:
		letters = ["c", "f", "j"]
		target = "g"
		Output: "j"

	Input:
		letters = ["c", "f", "j"]
		target = "j"
		Output: "c"

	Input:
		letters = ["c", "f", "j"]
		target = "k"
		Output: "c"
Note:
	letters has a length in range [2, 10000].
	letters consists of lowercase letters, and contains at least 2 unique letters.
	target is a lowercase letter.
*/

// Solution 1. Linear Search
			2. Binary Search
    
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        let uniT = UnicodeScalar(String(target))!.value
     // linear solution O(N)       
//         for ch in letters {
//             let unich = UnicodeScalar(String(ch))!.value
//             if Int(unich) - Int(uniT) > 0 {
//                 return ch
//             } else {
                
//             }
//         }
        // Binary Search O(logN)
        var left = 0
        var right = letters.count

        while left < right {
            var mid = (right - left)/2 + left
            let uniMid = UnicodeScalar(String(letters[mid]))!.value

            if uniMid > uniT { right = mid }
            else { left = mid + 1 }
        }
        return letters[left % letters.count]
    }