// 344. Reverse String
//	Write a function that takes a string as input and returns the string reversed.
//	Example:
//	Given s = "hello", return "olleh".

// Solution: 1. use swift native reversed() function -- runtime O(1) http://www.jianshu.com/p/388b02921efd
//			 2. use char 

    func reverseString(_ s: String) -> String {
        return String(s.characters.reversed())
    }

//	last one did not pass. (Very long input)
    func reverseString(_ s: String) -> String {
        var reversedS = ""
        if s.characters.count == 0 { return reversedS }
        for i in 1...s.characters.count {	// for lower range < upper range
            let str = s.index(s.startIndex, offsetBy: (s.characters.count - i))
            reversedS.append(s[str])
        }
        return reversedS
    }
// 	pass all
    func reverseString(_ s: String) -> String {
        var ret: String = ""
        for c in s.characters {
            ret.insert(c, at: ret.startIndex)
        }
        return ret
    }