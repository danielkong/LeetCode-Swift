// Smallest Difference between two sorted Arrays 
/**
Given two arrays of integers, compute the pair of values (one value in each array) with the smallest (non-negative) difference. Return the difference.
Input : A[] = {1, 2, 3, 11, 15}
        B[] = {8, 19, 23, 127, 235} 
Output : 3  
That is, the pair (11, 8) 

Input : A[] = {5, 10, 40}
        B[] = {50, 80, 90} 
Output : 10
*/
/**
	Idea: Move smaller one idx to next idx.
	Runtime: O(M+N)
	Space: 	 O(1)
*/

func findSmallestDiff(_ a: [Int], _ b: [Int]) -> Int {
	var idx1 = 0
	var idx2 = 0
	var res = Int.max

	while idx1 < a.count && idx2 < b.count {
		res = min(res, abs(a[idx1]-b[idx2])
		if a[idx1] < b[idx2] {
			idx1 += 1
		} else {
			idx2 += 1
		}
	}
	return res
}