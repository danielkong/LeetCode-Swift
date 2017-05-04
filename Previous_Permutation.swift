Previous Permutation
/**
previous permutation. 这个看看c++的algorithm库有实现.自己写一个也不难.  建议连同next permutation一起看了.
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=205979
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=214221

Given a list of integers, which denote a permutation.

Find the previous permutation in ascending order.
https://lefttree.gitbooks.io/leetcode/CombinationandPermutation/previousPermutation.html
*/

class Solution:
    # @param num :  a list of integer
    # @return : a list of integer
    def previousPermuation(self, num):
        # write your code here
        if not num:
            return None
        length = len(num)
        i = length - 2
        while i >= 0:
            if num[i] > num[i+1]:
                break
            i -= 1
        #already smallest
        if i == -1:
            num.reverse()
            return num
        for j in range(i+1, length):
            if j == length - 1:
                break
            if num[j] < num[i] and num[i] <= num[j+1]:
                break
        tmp = num[i]
        num[i] = num[j]
        num[j] = tmp
        num[i+1:length] = num[length-1:i:-1]

        return num

// This is next permutation best solution.
// Runtime O(n), Space O(1)
// 1. From end to begin, find first nums[i - 1] < nums[i], and store nums[i-1](this one needs swap)
// 2. Find a number, called temp, temp > nums[i-1] in subarray nums[i ..< nums.count] (from nums.count to i), swap(num[i-1], temp),
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

// 1. From end to begin, find first nums[i - 1] > nums[i]
// 2. Find a number, called temp, temp < nums[i-1] in subarray nums[i ..< nums.count] (from nums.count to i), swap(num[i-1], temp),
// 3. Reverse subarray

func previousPermutation(_ nums: inout [Int]) {
	// find a number/temp > nums[i-1] in subarray nums[i ..< nums.count], swap(num[i-1], temp), then reverse subarray

	guard nums.count > 1 else {
		return
	}
	// 1.
	var a = [-1, Int.max]
	for i in stride(from: nums.count - 1, to: 0, by: -1) {
		if nums[i] < nums[i - 1] {
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
		if a[1] > s {
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
