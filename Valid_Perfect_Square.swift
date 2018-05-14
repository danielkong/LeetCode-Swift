// 367. Valid Perfect Square
/**
Given a positive integer num, write a function which returns True if num is a perfect square else False.

Note: Do not use any built-in library function such as sqrt.

Example 1:

Input: 16
Returns: True
Example 2:

Input: 14
Returns: False
Credits:
Special thanks to @elmirap for adding this problem and creating all test cases.
*/

/**
	Idea: Newton algor.
*/

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var temp = num
        while temp * temp > num {
            temp = (temp + num/temp)/2
        }
        return temp*temp==num
    }
}