// 256. Paint House I 			Medium
/**
There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs0 is the cost of painting house 0 with color red; costs1 is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.

Note: All costs are positive integers.
*/
// DP Runtime: O(N)
//    Space: O(N) could enhance to O(1)
// Solution: DP Java
public int minCost(int[][] costs) {
    if(costs==null||costs.length==0){
        return 0;
    }
    for(int i=1; i<costs.length; i++){
        costs[i][0] += Math.min(costs[i-1][1],costs[i-1][2]);
        costs[i][1] += Math.min(costs[i-1][0],costs[i-1][2]);
        costs[i][2] += Math.min(costs[i-1][1],costs[i-1][0]);
    }
    int n = costs.length-1;
    return Math.min(Math.min(costs[n][0], costs[n][1]), costs[n][2]);
}

// Swift
public func minCost(_ costs: inout [[Int]]) {
    guard costs.count > 0 else {
        return
    }
    
    for i in 1..<costs.count {
        costs[i][0] += min(costs[i-1][1], costs[i-1][2])
        costs[i][1] += min(costs[i-1][0], costs[i-1][2])
        costs[i][2] += min(costs[i-1][0], costs[i-1][1])
    }
    let last = costs.count - 1
    return min(min(costs[last][0],costs[last][1]), costs[last][2])
}

// Swift with latest Leetcode

class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        // dp
        let n = costs.count
        guard n > 0 else { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: n+1)
        for i in 1 ... costs.count {
            dp[i][0] = costs[i][0] + min(dp[i-1][1], dp[i-1][2])
            dp[i][1] = costs[i][1] + min(dp[i-1][0], dp[i-1][2])
            dp[i][2] = costs[i][2] + min(dp[i-1][0], dp[i-1][1])
        }
        return min(dp[n][0], min(dp[n][1], dp[n][2]))
    }
}

// best Solution: 
class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        // dp
        let n = costs.count
        guard n > 0 else { return 0 }
        var r = 0, b = 0, g = 0
        for i in 0..<n {
            let curR = min(g, b) + costs[i][0]
            let curB = min(r, g) + costs[i][1]
            let curG = min(r, b) + costs[i][2]
            r = curR
            b = curB
            g = curG
        }
        return min(r, min(b, g))
    }
}

// 265        Paint House II         37.1%        Hard          
/**
There are a row of n houses, each house can be painted with one of the k colors. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by a n x k cost matrix. For example, costs0 is the cost of painting house 0 with color 0; costs1 is the cost of painting house 1 with color 2, and so on... Find the minimum cost to paint all houses.

Note: All costs are positive integers.

Follow up: Could you solve it in O(nk) runtime?
*/
// Solution Java: 

public class Solution {
    public int minCostII(int[][] costs) {
        if(costs != null && costs.length == 0) return 0;
        int prevMin = 0, prevSec = 0, prevIdx = -1;
        for(int i = 0; i < costs.length; i++){
            int currMin = Integer.MAX_VALUE, currSec = Integer.MAX_VALUE, currIdx = -1;
            for(int j = 0; j < costs[0].length; j++){
                costs[i][j] = costs[i][j] + (prevIdx == j ? prevSec : prevMin);
                // 找出最小和次小的，最小的要记录下标，方便下一轮判断
                if(costs[i][j] < currMin){
                    currSec = currMin;
                    currMin = costs[i][j];
                    currIdx = j;
                } else if (costs[i][j] < currSec){
                    currSec = costs[i][j];
                }
            }
            prevMin = currMin;
            prevSec = currSec;
            prevIdx = currIdx;
        }
        return prevMin;
    }
}
