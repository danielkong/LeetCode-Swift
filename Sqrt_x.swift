// 69. Sqrt(x)
/**
Implement int sqrt(int x).
Compute and return the square root of x.
*/
// Solution: Native Method sqrt(Double(x))
func mySqrt(_ x: Int) -> Int {
    return Int(sqrt(Double(x)))
}

// Solution: 1.  Use Newton's method from wiki Interger square root. x(k+1) = 1/2（x(k) + n/x(k)）
func mySqrt(_ x: Int) -> Int {
    guard x > 1 else {
        return x
    }
    
    var r = x
    while r*r > x {
        r = (r + x/r) / 2 // Newton method
    }
    return r
}

// Solution: 2. Binary Search, right should start with x / 2 + 1, thus its square is x + x ^ 2 / 4 + 1, which is definitely greater than x.
class Sqrtx {
    func mySqrt(x: Int) -> Int {
        guard x > 1 else {
            return x
        }
        
        var left = 0
        var right = x / 2 + 1 // use 'x' here also works
        var mid = 0

        while left <= right {
            mid = (right - left) / 2 + left
            
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
}