39. Combination Sum
/**
    Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

    The same repeated number may be chosen from C unlimited number of times.

    Note:
    All numbers (including target) will be positive integers.
    The solution set must not contain duplicate combinations.
    For example, given candidate set [2, 3, 6, 7] and target 7, 
    A solution set is: 
    [
      [7],
      [2, 2, 3]
    ]
*/
// Solution Swift: 
// Runtime: O(n^2) Space: O(2^n-1) 
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()

        helper(candidates.sorted(), target, &temp, &res, 0)

        return res
    }

    private func helper(_ candidates: [Int], _ target: Int, _ temp: inout [Int],_ res: inout [[Int]], _ idx: Int) {

        if target == 0 {
            res.append(temp)
            return
        }
        for i in idx..<candidates.count {
            if target - candidates[i] >= 0 {
                temp.append(candidates[i])
                helper(candidates, target-candidates[i], &temp, &res, i)
                temp.removeLast()
            }
        }
    }