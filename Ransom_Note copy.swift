// 383. Ransom Note
//	Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//	Each letter in the magazine string can only be used once in your ransom note.

// Solution: 1. Dictionary store character appear times. 

//	Runtime: 926 ms (beats 27.27%)
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        
        for ch in magazine.characters {
            if dict[ch] == nil {
                dict[ch] = 1
            } else {
                dict[ch]! += 1
            }
        }
        
        for r in ransomNote.characters {
            if dict[r] == nil {
                return false
            } else if dict[r] == 0 {
                return false
            } else {
                dict[r]! -= 1
            }
        }
        return true
    }