// 78 [Subsets](Subsets.swift)|36.6%|Medium |

/**
Given a set of distinct integers, nums, return all possible subsets.

Note: The solution set must not contain duplicate subsets.

For example,
If nums = [1,2,3], a solution is:

[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
*/

func subsets(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    res.append([])
    for i in 0..<nums.count {
        for item in res {
            var temp = item
            temp.append(nums[i])
            res.append(temp)
        }
    }
    return res
}

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        helper(&res, 0, nums)
        res.append([])
        return res
    }
    
    private func helper(_ res: inout [[Int]], _ index: Int, _ nums: [Int]) {
        for var item in res {
            item.append(nums[index])
            res.append(item)
        }
        res.append([nums[index]])

        if index + 1 < nums.count{
            helper(&res, index+1, nums)
        }
    }
}

/**
 * Question Link: https://leetcode.com/problems/subsets/
 * Primary idea: Classic Depth-first Search
 * 
 * Time Complexity: O(n!), Space Complexity: O(n)
 *
 */
 class Subsets {
    func subsets(nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        let nums = nums.sort({$0 < $1})
        
        _dfs(&res, &path, nums, 0)
        
        return res
    }
    
    private func _dfs(_ res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int) {
        // termination case
        res.append(Array(path))
        
        for i in index ..< nums.count {
            path.append(nums[i])
            _dfs(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}



|90|[Subsets II](Subsets_II.swift)|33.8%|Medium|        
/**
Given a collection of integers that might contain duplicates, nums, return all possible subsets.

Note: The solution set must not contain duplicate subsets.

For example,
If nums = [1,2,2], a solution is:

[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]
*/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        helper(&res, 0, nums.sorted())	// trick part is sorted
        res.append([])
        return res
    }

	private func helper(_ res: inout [[Int]], _ index: Int, _ nums: [Int]) {
	    for var item: [Int] in res {
	        item.append(nums[index])
	        if res.contains(where: { $0 == item }) { 
	            continue
	        } else {
	            res.append(item)
	        }
	    }
	    if !res.contains(where: { $0 == [nums[index]] }) {
	        res.append([nums[index]])
	    }
	    
	    if index + 1 < nums.count{
	        helper(&res, index+1, nums)
	    }
	}
}
// Trick: 
// if not sorted res.contains(where: { $0 == item }) will consider [0,1] != [1,0] then provide more output than expected. 
// But if use Set($0) == Set(item), consider [4] == [4, 4] provide less output than expected.

/**
 * Question Link: https://leetcode.com/problems/subsets-ii/
 * Primary idea: Classic Depth-first Search, avoid duplicates by adopting the first occurrence
 * 
 * Time Complexity: O(n!), Space Complexity: O(n)
 *
 */

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        let nums = nums.sorted()
        
        dfs(&res, &path, nums, 0)
        
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int) {
        res.append(Array(path))
        
        for i in index ..< nums.count {
            if i > 0 && nums[i] == nums[i - 1] && i != index {
                continue
            }
            
            path.append(nums[i])
            dfs(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}



func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let sortedNums = nums.sorted()
    var ans = [[Int]]()
    ans.append([Int]())
    var count = 0
    var startIndex = 0
    for i in 0..<sortedNums.count {
        if i > 0 && sortedNums[i] == sortedNums[i-1] {
            startIndex = count
        } else {
            startIndex = 0
        }
        count = ans.count
        for j in startIndex..<count {
            var temp = ans[j]
            temp.append(sortedNums[i])
            ans.append(temp)
        }
    }
    return ans
}

func subsets(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    res.append([])
    for i in 0..<nums.count {
        for item in res {
            var temp = item
            temp.append(nums[i])
            res.append(temp)
        }
    }
    return res
}
