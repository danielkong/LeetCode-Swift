// 29. Divide Two Integers
/**
// from glassdoor
 Implement division without using multiplication or division.
 It should work most efficient and fast.

 // leetcode
 Divide two integers without using multiplication, division and mod operator.

If it is overflow, return MAX_INT.
*/
// Solution: Bit Manipulation
// Note: Swift,
// Int
//
// In most cases, you don’t need to pick a specific size of integer to use in your code. Swift provides an additional integer type, Int, which has the same size as the current platform’s native word size:
//
// On a 32-bit platform, Int is the same size as Int32.
//
// On a 64-bit platform, Int is the same size as Int64.
//
// Unless you need to work with a specific size of integer, always use Int for integer values in your code. This aids code consistency and interoperability. Even on 32-bit platforms, Int can store any value between -2,147,483,648 and 2,147,483,647, and is large enough for many integer ranges.
// print(Int8.min)	-128
// print(Int16.min)	-32768
// print(Int32.min)	-2147483648
// print(Int64.min)	-9223372036854775808
// print(Int.min)	-9223372036854775808
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    // special case:
    if divisor == 0 || (dividend == Int.min && divisor == -1) {
        return Int.max
    }

    let testing = dividend < 0 ? 1 : 0
    let testing2 = divisor < 0 ? 1 : 0

    let sign = (testing ^ testing2 == 1) ? -1 : 1
    var dvd = abs(dividend)
    let dvs = abs(divisor)
    var res = 0
    while (dvd >= dvs) {
        var temp = dvs, multiple = 1
        while dvd >= (temp << 1) {
            temp <<= 1
            multiple <<= 1
        }
        dvd -= temp
        res += multiple
    }
    return sign == 1 ? res: -res
}

// Above solution won't pass last test case, which is (-2147483648, -1), since swift does not overflow
func divide(_ dividend: Int32, _ divisor: Int32) -> Int32 {
    // special case:
    let o = Int32.min
    if divisor == 0 || (dividend == o && divisor == -1) {
        return Int32.max
    }

    let testing = dividend < 0 ? 1 : 0
    let testing2 = divisor < 0 ? 1 : 0

    let sign = (testing ^ testing2 == 1) ? -1 : 1
    var dvd = abs(dividend)
    let dvs = abs(divisor)
    var res: Int32 = 0
    while (dvd >= dvs) {
        var temp = dvs, multiple: Int32 = 1
        while dvd >= (temp << 1) {
            temp <<= 1
            multiple <<= 1
        }
        dvd -= temp
        res += multiple
    }
    return sign == 1 ? res: -res
}
