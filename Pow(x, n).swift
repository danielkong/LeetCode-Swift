// 50        Pow(x, n)        27.1%        Medium        
/**
Implement pow(x, n). x Double, n Int
*/

/**
 * 
 * Primary idea: Classic Recursion and handle positive/negative case at first
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */

 // Swift Solution 1 -- short and clean
 class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 { return 0 }
        if n == 0 { return 1 }
        if n < 0 { return 1/(myPow(x, abs(n))) }
        
        let a = n / 2
        let b = n % 2
        if b == 1 {
            return x * myPow(x*x, a)
        } else {
            return myPow(x*x, a)
        }        
    }
}

 // Swift Solution 2
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard x != 0 else {
            return 0
        }
        
        guard n != 0 else {
            return 1
        }
        
        var res = helper(abs(x), abs(n))
        if n < 0 {
            res = 1/res    
        }
        if n%2 != 0 && x < 0 {
            res = -res
        }
        return res
    }
    
    private func helper(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else {
            return 1
        }
        guard n != 1 else {
            return x
        }
        
        if n % 2 == 0 {
            return helper(x * x, n/2)
        } else {
            return helper(x, n-1) * x
        }
    }
}