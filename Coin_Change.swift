// 322. Coin Change 26.2%	Medium
/**
You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

Example 1:
coins = [1, 2, 5], amount = 11
return 3 (11 = 5 + 5 + 1)

Example 2:
coins = [2], amount = 3
return -1.

Note:
You may assume that you have an infinite number of each kind of coin.
*/
// Solution Swift: real world. Runtime O(NlogN), Space O(n)<Swift>, O(1)<Java>
// if it's real world, then 1,2,5 could combine any number
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    let sortedCoins = coins.sorted(){ $0 > $1 }
    var tempAmount =  amount
    var count = 0
    for item in sortedCoins {
        if item <= tempAmount {
            count += tempAmount/item
            tempAmount %= item
        }
        if tempAmount == 0 {
            return count
        }
    }
    
    return -1
}

// if any coins, then Dynamic Programming.
// Solution: Runtime O(n^2) space O(n)
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount != 0 else {
        return 0
    }
    
    var dp = Array(repeating: -1, count: amount + 1)
    for i in 0 ... amount {
        for coin in coins {
            if coin == i {
                dp[i] = 1
                break
            }
            
            if coin < i && dp[i-coin] != -1 {
                if dp[i] == -1 {
                    dp[i] = dp[i-coin] + 1
                } else {
                    dp[i] = min(dp[i], dp[i-coin] + 1)
                }
            }
        }
    }
    
    return dp[amount]
}

let start = Date(); // <<<<<<<<<< Start time
let res = coinChange([186,419,83,408], 6249)
let end = Date();
let timeInterval: Double = end.timeIntervalSince(start as Date)
print(timeInterval)
