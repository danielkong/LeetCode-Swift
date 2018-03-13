40. Combination Sum II
/**
	Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

	Each number in C may only be used once in the combination.

	Note:
	All numbers (including target) will be positive integers.
	The solution set must not contain duplicate combinations.
	For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8, 
	A solution set is: 
	[
	  [1, 7],
	  [1, 2, 5],
	  [2, 6],
	  [1, 1, 6]
	]
*/
// Solution: Swift backtracking
// Runtime: Space: 
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()

        helper(candidates.sorted(), target, &temp, &res, 0)

        return res 
    }
    
    private func helper(_ candidates: [Int], _ target: Int, _ temp: inout [Int],_ res: inout [[Int]], _ idx: Int) {

        if target == 0 {
            // if !res.contains(where: { $0 == temp }) {
            //     res.append(temp) 
            // }
            res.append(temp)
            return
        }
        for i in idx..<candidates.count {

            if target - candidates[i] >= 0 {
                if i > 0 && candidates[i] == candidates[i - 1] && i != idx {
                    continue
                }
                temp.append(candidates[i])
                helper(candidates, target-candidates[i], &temp, &res, i+1)
                temp.removeLast()
            }
        }
    }
}