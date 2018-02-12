// 17 Letter Combinations of a Phone Number
/**
 *
 * Primary idea: Classic Depth-first Search, create phone board at first
 *
 * Time Complexity: O(nm), m stands for the average size of a string represented by a number
 * Space Complexity: O(n)
 *
 */
/**
Given a digit string, return all possible letter combinations that the number could represent.
A mapping of digit to letters (just like on the telephone buttons) is given below.

Input:Digit string "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
*/

// Solution: Swift
class Solution {
    let dict: [Character: [Character]] = [
        "2" : ["a", "b", "c"],
        "3" : ["d", "e", "f"],
        "4" : ["g", "h", "i"],
        "5" : ["j", "k", "l"],
        "6" : ["m", "n", "o"],
        "7" : ["p", "q", "r", "s"],
        "8" : ["t", "u", "v"],
        "9" : ["w", "x", "y", "z"],
        ]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits == "" { return [] }
        
        var temp = ""
        var res = [String]()
        helper(&res, temp, 0, [Character](digits.characters))
        return res
    }
    
    private func helper(_ res: inout [String], _ temp: String, _ idx: Int, _ chs:[Character]) {
        if idx == chs.count {
            res.append(temp)
            return
        }
        
        var temp = temp
        if let ch: Character = chs[idx], let map = dict[ch] {
            for i in 0 ..< map.count {
                temp.append(map[i])
                helper(&res, temp, idx+1, chs)
                // name.substring(to: name.index(before: name.endIndex))
                temp = temp.substring(to: temp.index(before: temp.endIndex))
            }
        }
    }
}

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

// Solution Java:

public class Solution {
    public List<String> letterCombinations(String digits) {
        ArrayList<String> res = new ArrayList<String>();
        StringBuilder list = new StringBuilder();
        if (digits == null)
            return res;

        Map<Character, char[]> map = new HashMap<Character, char[]>();
        map.put('0', new char[] {});
        map.put('1', new char[] {});
        map.put('2', new char[] { 'a', 'b', 'c' });
        map.put('3', new char[] { 'd', 'e', 'f' });
        map.put('4', new char[] { 'g', 'h', 'i' });
        map.put('5', new char[] { 'j', 'k', 'l' });
        map.put('6', new char[] { 'm', 'n', 'o' });
        map.put('7', new char[] { 'p', 'q', 'r', 's' });
        map.put('8', new char[] { 't', 'u', 'v'});
        map.put('9', new char[] { 'w', 'x', 'y', 'z' });

        helper(map, digits, res, list);
        return res;
    }

    private void helper(Map<Character, char[]> map, String digits, ArrayList<String> res, StringBuilder sb) {
        if (sb.length() == digits.length()) {
            res.add(sb.toString());
            return;
        }

        for (char c : map.get(digits.charAt(sb.length()))) {
            sb.append(c);
            helper(map, digits, res, sb);
            sb.deleteCharAt(sb.length() - 1);
        }
    }
}

// Solution Swift:
// This solution is valid input, does not consider invalid number(0 or 1) in middle or end cases, like: 304, or 340.
// inprovment -> set 0 : [" "], 1: [" "]
private let dict: Dictionary<Int, [Character]> = [
    0 : [],
    1 : [],
    2: ["a", "b", "c"],
    3: ["d", "e", "f"],
    4 : ["g", "h", "i"],
    5 : ["j", "k", "l"],
    6 : ["m", "n", "o"],
    7 : ["p", "q", "r", "s"],
    8 : ["t", "u", "v"],
    9 : ["w", "x", "y", "z"]
]

private func letterCombinations(_ num: Int) -> [[Character]] {
    // int number -> digits [int]
    let arr = convertNumToNumArr(num)
    var res = [[Character]]()
    var word = [Character]()
    // digits [int] -> letter [Character]
    helper(arr, &word, &res, 1)

    // [Character] -> String

    return res
}

private func convertNumToNumArr(_ num: Int) -> [Int] {
    var divideTen = num
    var modTen = num
    var digits = 0
    var numArr: [Int] = []

    while divideTen != 0 || modTen != 0 {
        modTen = divideTen % 10
        divideTen /= 10

        numArr.append(modTen)
        digits += 1
    }

    return numArr.reversed()
}

private func helper(_ numbers: [Int], _ word: inout [Character], _ res: inout [[Character]], _ index: Int) {
    if index == numbers.count {
        res.append(word)
        return
    } else {
        print(numbers[index])
        print(dict[numbers[index]])
        if let temp = dict[numbers[index]] {
            for ch in temp {
                word.append(ch)
                helper(numbers, &word, &res, index + 1)
                word.removeLast()
            }
        }
    }
}

let res = letterCombinations(34)
print(res)

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
