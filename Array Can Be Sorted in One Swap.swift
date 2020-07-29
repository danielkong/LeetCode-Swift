// Array Can Be Sorted in One Swap
/**
Given an array containing N elements. Find if it is possible to sort it in non-decreasing order using atmost one swap.

Input : arr[] = {1, 2, 3, 4}
Output : YES
The array is already sorted

Input : arr[] = {3, 2, 1}
Output : YES
Swap 3 and 1 to get [1, 2, 3]

Input : arr[] = {4, 1, 2, 3}
Output :NO
*/
// Solution 1: Sorted array then compare
// Runtime: O(NlogN)
// how about array already sorted?
// 1 number in wrong order could not swap with one time
// 2 numbers in wrong order could swap with one time
// 3 numbers in wrong order could not swap with one time
// 4 numbers in wrong order could not swap with one time

func checkSorted(_ arr: [Int]) -> Bool {
	guard arr.count > 2 else { return true }
	var sortedArr = arr.sorted()
	var diff = 0
	for i in 0..<arr.count {
		if arr[i] != sortedArr[i] {
			diff += 1
		}
	}
	return diff == 0 || diff == 2
}


// Solution 2: 
// Runtime: O(N)
func checkSorted(_ arr: [Int]) -> Bool {
	guard arr.count > 2 else { return true }
	var arr = arr
	var diff = 0
	var first = -1, second = -1
	for i in 1..<arr.count {
		if arr[i] < arr[i-1] {
			diff += 1
			if first == -1 {
				first = i 
			} else {
				second = i
			} 
		}
	}

	if diff > 2 { return false }
	if diff == 0 { return true }
	// [1,5,3,4,2]
	if count == 2 {
		(arr[first-1], arr[second]) = (arr[second], arr[first-1])
	} else if diff == 1 { // [1,2,4,3,5]
		arr.swapAt(first-1, first)
	}

	// check arr again for case [4,1,2,3]
	for i in 1..<n {
		if arr[i] < arr[i-1] {
			 return false
		} 
	}
	return true
}
