// 202. Happy Number
/**
	Write an algorithm to determine if a number is "happy".

	A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

	Example: 19 is a happy number

	12 + 92 = 82
	82 + 22 = 68
	62 + 82 = 100
	12 + 02 + 02 = 1
*/
/** Solution: 
    Runtime O(n) Space: O(n)
    Time complexity: O(log*n) or almost O(1)  
    Space complexity: O(log*n)

*/
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var num = n
        var set = Set<Int>()
        
        while num != 1 {
            guard !set.contains(num) else {
                return false
            }
            set.insert(num)
           
            var temp = 0
            while num != 0 {
                temp += (num % 10) * (num % 10)
                num = num / 10
            }
            num = temp
        }
        return true   
    }
}
