// 190. Reverse Bits
/**
Reverse bits of a given 32 bits unsigned integer.

For example, given input 43261596 (represented in binary as 00000010100101000001111010011100), return 964176192 (represented in binary as 00111001011110000010100101000000).

Follow up:
If this function is called many times, how would you optimize it?

Related problem: Reverse Integer

Credits:
Special thanks to @ts for adding this problem and creating all test cases.
*/
class Solution {
	func reversedBits(_ n: UInt32) -> UInt32 {
		var n: UInt32 = n
		var m: UInt32 = 0
		var i: UInt32 = 32
		while i > 0 && n != 0  {
			m = m << 1 + n & 0b1
			n = n >> 1
			i -= 1
		}
		m = m << i
		return m
	}
}

// Solution:
public int reverseBits(int n) {
	int result = 0;
	for (int i = 0; i < 32; i++) {
		result += n & 1;
		n >>>= 1;   // CATCH: must do unsigned shift
		if (i < 31) // CATCH: for last digit, don't shift!
			result <<= 1;
	}
	return result;
}
