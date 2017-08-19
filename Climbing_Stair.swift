// 70. Climbing Stairs
/**
You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Note: Given n will be a positive integer.
*/

// Recursion
// Runtime: O(n), Space: O(1)
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        return climbStairs(n-1) + climbStairs(n-2)
    }
}

// Recursion
// Runtime: O(n), Space: O(n)
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        var res = Array(repeating: 0, count: n+1)
        res[0] = 1
        res[1] = 1
        for i in 2 ... n {
            res[i] = res[i-1] + res[i-2]
        }
        return res[n]
    }
}
