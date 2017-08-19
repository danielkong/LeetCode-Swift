// 118. Pascal's Triangle
/**
Given numRows, generate the first numRows of Pascal's triangle.

For example, given numRows = 5,
Return

[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
*/
// Solution
// Runtime O(N^2)
func generate(_ numRows: Int) -> [[Int]] {
	var currRow = 0
	var res = [[Int]]()

	for i in 0 ..< numRows {
		var currentResults = [Int]()
		for j in 0 ... i {
			if i > 0 && j > 0 && j < i {
				let value = res[i - 1][j] + res[i - 1][j - 1]
				currentResults.append(value)
			} else {
				currentResults.append(1)
			}
		}
		res.append(currentResults)
	}
	return res
}

// Need Cache. Exceed Limited Time
class Solution {
    // recursion with space 1
    // recustion with space n -- array
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return [[Int]]()
        }
        var res = [[Int]]()
        for i in 1 ... numRows {
            res.append(help(i))
            print(res)
        }
        return res
    }

    func help(_ i: Int) -> [Int] {
        if i == 1 { return [1] }
        else if i == 2 { return [1, 1] }
        else {
            var res = Array(repeating: 1, count: i)
            for j in 0 ..< i {
                if j == 0 || j == i-1 {
                    res[j] = 1
                } else {
                    res[j] = help(i-1)[j-1] + help(i-1)[j]
                }
            }
            return res
        }
        return []
    }
}
