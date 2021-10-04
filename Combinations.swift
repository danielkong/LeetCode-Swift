/**
77. Combinations
Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].

You may return the answer in any order.

 

Example 1:

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
Example 2:

Input: n = 1, k = 1
Output: [[1]]
 

Constraints:

1 <= n <= 20
1 <= k <= n

*/

/**
 Solution 1: dfs. Packtracking
*/

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    
    var res: [[Int]] = []
    var temp: [Int] = []
    
    helper(&res, &temp, 1, k, n)
    return res
}

func helper(_ res: inout [[Int]], _ temp: inout [Int], _ index: Int, _ k: Int, _ n: Int) {
    
    if temp.count == k {
        res.append(temp)
        return
    }
    
    for i in index..<(n+1) {
    
        temp.append(i)
        helper(&res, &temp, i+1, k, n)
        temp.removeLast()
    }
}
