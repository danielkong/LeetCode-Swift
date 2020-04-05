// 122. Best Time to Buy and Sell Stock II	Easy

/**
Say you have an array for which the ith element is the price of a given stock on day i.

Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
*/

// Solution: Swift

class Solution {
//  time O(n), space O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        // count all ascend order sequence
        guard prices.count > 1 else { return 0 }
        var prev = prices[0]
        var profit = 0
        for i in 1 ..< prices.count {
            if prices[i] > prev {
                profit += (prices[i]-prev)
            }
            prev = prices[i]
        }
        return profit
    }
} 