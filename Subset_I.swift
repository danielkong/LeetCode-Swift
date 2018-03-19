// Power set Subset I
/**
https://instant.1point3acres.com/thread/204422
做了一题powerset，给了个iterative的解法，又有点小bug（不得不说面试真的很容易紧张犯错弄出平时刷题不会出的错）。
稍微debug了一下，面试官又犹豫要不要继续出题了。。
我让他继续，就follow up了powerset iterator，时间不够了给了思路，
然后follow up big o。

Power Set Power set P(S) of a set S is the set of all subsets of S.
For example S = {a, b, c}
then P(s) = {{}, {a}, {b}, {c}, {a,b}, {a, c}, {b, c}, {a, b, c}}.
If S has n elements in it then P(s) will have 2^n elements
Time Complexity: O(n2^n)

http://www.weiming.info/zhuti/JobHunting/32973055/
*/
/**
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
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

// Solution: DFS
//      runtime O(n^2) space O(n)
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        res.append([])
        helper(&res, nums)
        return res
    }
    private func helper(_ res: inout [[Int]], _ nums: [Int]) {
        for i in 0..<nums.count {
            for item in res {
                var temp = item
                temp.append(nums[i])
                res.append(temp)
            }
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
        
        let nums = nums.sorted(by: <)
        
        _dfs(&res, &path, nums, 0)
        
        return res
    }
    
    private func _dfs(inout res: [[Int]], inout _ path: [Int], _ nums: [Int], _ index: Int) {
        // termination case
        res.append(Array(path))
        
        for i in index..<nums.count {
            path.append(nums[i])
            _dfs(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}
