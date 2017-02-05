// 17 Letter Combinations of a Phone Number

// Solution: Java
	public void helper(List<String> result, StringBuilder sb, String digits, int index, HashMap<Character, char[]> map){
	    if(index>=digits.length()){
	        result.add(sb.toString());
	        return;
	    }
		char c = digits.charAt(index);
	    char[] arr = map.get(c);
		for(int i=0; i<arr.length; i++){
	        sb.append(arr[i]);
	        helper(result, sb, digits, index+1, map);
	        sb.deleteCharAt(sb.length()-1);
	    }
	}

// Solution: Swift
class Solution {
    var results = [String]()
    func letterCombinations(_ digits: String) -> [String] {
        var chars = [Character](digits.characters)
        let dict = initDict()
        guard chars.count > 0 else {
            return results
        }
        helper("", dict, chars, 0)
        return results
    }

    private func initDict() -> [Character: [Character]] {
            var dict = [Character: [Character]]()
            dict["2"] = ["a", "b", "c"]
            dict["3"] = ["d", "e", "f"]
            dict["4"] = ["g", "h", "i"]
            dict["5"] = ["j", "k", "l"]
            dict["6"] = ["m", "n", "o"]
            dict["7"] = ["p", "q", "r", "s"]
            dict["8"] = ["t", "u", "v"]
            dict["9"] = ["w", "x", "y", "z"]
            
            return dict
    }
    
    private func helper(_ str: String, _ dict: [Character: [Character]], _ chars: [Character], _ atIndex: Int) -> Void {
        var strVar = str
        if atIndex >= chars.count {
            results.append(strVar)
            return
        }
        
        let ch = chars[atIndex]
        let map: [Character]! = dict[ch]
        
        for i in 0..<map.count {
            strVar.append(map[i])
            helper(strVar, dict, chars, atIndex+1)
            strVar = String(strVar.characters.dropLast())
        }
    }
}



