// 383. Ransom Note
/**
Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

Each letter in the magazine string can only be used once in your ransom note.

Note:
You may assume that both strings contain only lowercase letters.

canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true
*/

// Solution 1: remove ransom ch exist in magazine
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
	var mag = magazine
	var ran = ransomNote
	for c in ransomNote.characters {
		if mag.contains("\(c)") {
			mag.remove(at: (mag.range(of: "\(c)")?.lowerBound)!)
			ran.remove(at: (ran.range(of: "\(c)")?.lowerBound)!)
		} else {
			return false
		}
	}
	return ran == "" ? true : false
}

// Solution 2: use 2 dictionaries or 1 dictionary
// Use 1 dict
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var dict = [Character: Int]()
    
    for ch in Array(magazine) {
        if dict[ch] == nil {
            dict[ch] = 1
        } else {
            dict[ch]! += 1
        }
    }
    
    for r in Array(ransomNote) {
        if dict[r] == nil || dict[r] == 0 {
            return false
        } else {
            dict[r]! -= 1
        }
    }
    return true
}
// Use 2 dict
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
	// hashtable key letter - value appear count
	var dict = [Character: Int]()
	var dict2 = [Character: Int]()

	for ch in ransomNote.characters {
		if dict[ch] != nil {
			dict[ch]! += 1
		} else {
			dict[ch] = 1
		}
	}

	for ch in magazine.characters {
		if dict2[ch] != nil {
			dict2[ch]! += 1
		} else {
			dict2[ch] = 1
		}
	}

	for key in dict.keys {
		if dict2[key] != nil {
			if dict2[key]! - dict[key]! < 0 {return false}
		} else {
			return false
		}
	}

	return true
}
