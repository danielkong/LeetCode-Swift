// 31. Next_Permutation
/**
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place, do not allocate extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1
*/
/**
在当前序列中，从尾端往前寻找两个相邻元素，前一个记为first，后一个记为second，并且满足first 小于 second。然后再从尾端寻找另一个元素number，如果满足first 小于number，即将第first个元素与number元素对调，并将second元素之后（包括second）的所有元素颠倒排序，即求出下一个序列

example:
6，3，4，9，8，7，1
此时 first ＝ 4，second = 9
从尾巴到前找到第一个大于first的数字，就是7
交换4和7，即上面的swap函数，此时序列变成6，3，7，9，8，4，1
再将second＝9以及以后的序列重新排序，让其从小到大排序，使得整体最小，即reverse一下（因为此时肯定是递减序列）
得到最终的结果：6，3，7，1，4，8，9
*/

/** 
    Best Solution: 1. From last digit, if prev digit larger than curr digit, then swap. 
                (correction: find smallest larger than curr digit number, swap)

                Note: must use `temp-curr >= val`, otherwise, it will fail on [2,3,1,3,3] since after swapping 3,1,3, then reverse does not right.
    runtime: O(n)
    space: O(1)
*/
    func nextPermutation(_ nums: inout [Int]) {
        // from last digit, if prev digit larger than curr digit, then swap.
        // if no find, reverse whole.
        let n = nums.count
        var currIndex = n - 2
        
        while currIndex >= 0 {
            let curr = nums[currIndex], prev = nums[currIndex+1]
            if prev > curr {
                // find smallest larger current digit from currentIndex+1 to end of digit
                var temp = prev, tempIndex = currIndex+1
                for i in currIndex+1..<n {
                    let val = nums[i]-curr
                    if temp-curr >= val && val > 0 {
                        temp = nums[i]
                        tempIndex = i
                    }
                }
                
                (nums[currIndex], nums[tempIndex]) = (nums[tempIndex],nums[currIndex])
                nums[currIndex+1...n-1].reverse()
                return
            }
            currIndex -= 1
        }
        
        // no find, reverse whole array
        nums.reverse()
    }

// runtime O(n^2), space O(n)[worst case], following is enhanced solution
func nextPermutation(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }

    for i in stride(from: nums.count - 1, to: 0, by: -1) {
//    for i in [1..<nums.count].reversed() { // does not support i-1, binary operator '-' cannot be applied to operands of type 'CountableRange<Int>' and 'Int'
        if nums[i] > nums[i - 1] {
            // reverse subarray
            let reversedSubarray = Array(nums[i..<nums.count].reversed())
            var j = i
            var k = nums.count-1
            while j < k {
                let a = nums[j]
                nums[j] = nums[k]
                nums[k] = a
                j += 1
                k -= 1
            }
            if nums[i] > nums[i - 1] {
                // case [3,1,2] -> [3,2,1]
                let temp = nums[i]
                nums[i] = nums[i-1]
                nums[i-1] = temp
                return
            } else {
                // find a number > nums[i-1] in subarray
                for (p, s) in reversedSubarray.enumerated() {
                    if nums[i-1] < s {
                        let temp = s
                        nums[i+p] = nums[i-1]
                        nums[i-1] = temp
                        return
                    }
                }
            }
        }
    }
    nums.reverse()
}

// runtime O(n^2), space O(n)[worst case], following is enhanced solution
func nextPermutation(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }

    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        if nums[i] > nums[i - 1] {
            // reverse subarray
            var j = i
            var k = nums.count-1
            while j < k {
                let a = nums[j]
                nums[j] = nums[k]
                nums[k] = a
                j += 1
                k -= 1
            }
            if nums[i] > nums[i - 1] {
                // case [3,1,2] -> [3,2,1]
                let temp = nums[i]
                nums[i] = nums[i-1]
                nums[i-1] = temp
                return
            } else {
                // find a number > nums[i-1] in subarray
                for (p, s) in nums[i..<nums.count].enumerated() {
                    if nums[i-1] < s {
                        let temp = s
                        nums[i+p] = nums[i-1]
                        nums[i-1] = temp
                        return
                    }
                }
            }
        }
    }
    nums.reverse()
}

// Runtime O(n), Space O(1)
// 1. From end to begin, find first nums[i] > nums[i - 1], and store nums[i-1](this one needs swap)
// 2. Find a number, called temp, temp > nums[i-1] in subarray nums[i ..< nums.count], swap(num[i-1], temp),
// 3. Reverse subarray

func nextPermutation(_ nums: inout [Int]) {
	// find a number/temp > nums[i-1] in subarray nums[i ..< nums.count], swap(num[i-1], temp), then reverse subarray

	guard nums.count > 1 else {
		return
	}
	// 1.
	var a = [-1, Int.max]
	for i in stride(from: nums.count - 1, to: 0, by: -1) {
		if nums[i] > nums[i - 1] {
			a = [i-1, nums[i - 1]]
			break
		}
	}
	if a[0] == -1 {
		nums.reverse()
		return
	}
	// 2.
	for (p, s) in nums[a[0]+1..<nums.count].enumerated().reversed() {
		if a[1] < s {
			let temp = s
			nums[a[0]+1+p] = nums[a[0]]
			nums[a[0]] = temp
			break
		}
	}
	// 3. reverse subarray
	var j = a[0]+1
	var k = nums.count-1
	while j < k {
		let test = nums[j]
		nums[j] = nums[k]
		nums[k] = test
		j += 1
		k -= 1
	}
}
