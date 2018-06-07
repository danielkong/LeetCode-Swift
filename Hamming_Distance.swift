// 461        Hamming Distance        73.0%        Easy        
/** 
The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

Given two integers x and y, calculate the Hamming distance.

Note:
0 ≤ x, y < 231.

Example:

Input: x = 1, y = 4

Output: 2

Explanation:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

The above arrows point to positions where the corresponding bits are different.
*/

/**
 Solution: 1. Bitwise Operators
let firstBit: UInt8 = 0b10000000
let lastBit: UInt8  = 0b00000001
let invertedBits = ~lastBit  // 等于 0b11111110
let noneBit = firstBit & lastBit  // 等于 0b00000000
let twoSideBits = firstBit | lastBit //等于 0b10000001
let middleSixBits = firstBit ^ lastBit //等于 0b10000001
*/
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var res = 0
        let temp = x^y
        for i in 0..<32 {
            res += (temp >> i) & 1
        }
        return res
    }

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        guard x >= 0 && y >= 0 else {
            return 0
        }
        
        var differentBits = x ^ y
        var count = 0
        while differentBits > 0 {
            count += 1
            differentBits = (differentBits & (differentBits - 1))
        }
        
        return count
    }
}
