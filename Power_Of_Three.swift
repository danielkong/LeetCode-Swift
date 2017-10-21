Power of three

// Recursion
func isPowerOfThree(_ n: Int) -> Bool {
	guard n != 0 else { return false }
	if n == 1 { return true }
	var res = n/3
	var a = n%3

	if a == 0 {
		if res == 1 {
			return true
		} else {
			return isPowerOfThree(res)
		}
	}
	return false
}

// Iterative
func isPowerOfThree(_ n: Int) -> Bool {
	if n < 1 {
		return false
	}

	var n = n
	while n % 3 == 0 {
		n /= 3
	}

	return n == 1
}
