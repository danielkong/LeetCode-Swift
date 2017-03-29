// 123. Best Time to Buy and Sell Stock III
/**
Say you have an array for which the ith element is the price of a given stock on day i.

Design an algorithm to find the maximum profit. You may complete at most two transactions.

Note:
You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
*/
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var buy = Int.min
        var sell = 0
        var buy2 = Int.min
        var sell2 = 0
        for price in prices {
            sell2 = max(sell2, price + buy2)
            buy2 = max(buy2, sell - price)
            sell = max(sell, price + buy)
            buy = max(buy, -price)

        }
        return sell2
    }