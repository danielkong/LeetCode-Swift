// 7. Reverse Integer
/**
Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321

*/

func reverse(_ x: Int) -> Int {
	var x = x
	var result = 0

	while x != 0 {
		result = result*10 + x%10
		x /= 10
		if result > Int(Int32.max) || result < Int(Int32.min) { return 0 }
	}

	return result
}
