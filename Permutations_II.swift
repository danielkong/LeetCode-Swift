// 47. Permutations II
/**

Given a collection of numbers that might contain duplicates, return all possible unique permutations.

Example:

Input: [1,1,2]
Output:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]

*/

/**
	Idea: Number with Duplicates.
			1. deal with duplicates result when temp add to res. -- sort temp then compare in res
			2. deal with duplicates when generates temp array. -- visited array
				Can we sort it? to make it easier to solve duplicates result
				

*/

Solution with 2 idea:
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        var visited = Array(repeating: false, count: nums.count)
        helper(&res, &temp, nums.sorted(), &visited)
        return res
    }
    
    func helper(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ visited: inout [Bool]) {
        if temp.count == nums.count {
            res.append(temp)
            return
        }
        
        for i in 0..<nums.count {
            if visited[i] || (i>0 && nums[i] == nums[i-1] && visited[i-1] == true) { continue }
            temp.append(nums[i])
            visited[i] = true
            helper(&res, &temp, nums, &visited)
            visited[i] = false
            temp.removeLast()
        }
    }
}