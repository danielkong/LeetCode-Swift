// 633. Sum of Square Numbers
/**
Given a non-negative integer c, your task is to decide whether there're two integers a and b such that a2 + b2 = c.

    Example 1:
        Input: 5
        Output: True
        Explanation: 1 * 1 + 2 * 2 = 5

    Example 2:
        Input: 3
        Output: False
*/

    /**
    public boolean judgeSquareSum(int c) {
        HashSet<Integer> set = new HashSet<Integer>();
        
        for (int i = 0; i <= Math.sqrt(c); i++) {
            set.add(i * i);
            if (set.contains(c - i * i)) {
                return true;
            }
        }
        return false;
    }
    */

// Fastest Swift Solution
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
       var left = 0
        var right = Int(sqrt(Double(c)))
        
        while left <= right {
            let sum = left * left + right * right
            if sum == c {
                return true
            } else if sum < c {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return false

    }
}


    func judgeSquareSum(_ c: Int) -> Bool {
        var set = Set<Int>()
        
        for i in 0...Int(sqrt(Double(c))) {
            set.insert(i*i)
            if set.contains(c-i*i) {
                return true
            }
        }
        return false
    }