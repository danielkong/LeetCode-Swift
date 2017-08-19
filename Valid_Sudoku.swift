// 36. Valid Sudoku
// The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

/**
 * Question Link: https://leetcode.com/problems/valid-sudoku/
 * Primary idea: Check rows, columns, and single square separately
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
 func isValidSudoku(_ board: [[Character]]) -> Bool {
	 // line
	 var checker : Character = "."
	 for i in 0 ..< 9 {
		 var cSet = [Character]()
		 for j in 0 ..< 9 {
			 let num = board[i][j]
			 if num == checker { continue }
			 if !cSet.contains(num) {
				 cSet.append(num)
			 } else {
				 return false
			 }
		 }
	 }
	 //row
	 for i in 0 ..< 9 {
		 var cSet = [Character]()
		 for j in 0 ..< 9 {
			 let num = board[j][i]
			 if num == checker { continue }
			 if !cSet.contains(num) {
				 cSet.append(num)
			 } else {
				 return false
			 }
		 }
	 }
	 // block
	 //initial coordinate (0,0),(0,3),(0,6)
	 for i in stride(from:0, to: 9, by: 3) {
		 for j in stride(from: 0, to: 9, by: 3) {
			 var cSet = [Character]()
			 for m in i ..< i+3 {
				 for n in j ..< j+3 {
					 let num = board[n][m]
					 if num == checker {continue}
					 if !cSet.contains(num) {
						 cSet.append(num)
					 } else {
						 return false
					 }
				 }
			 }
		 }
	 }

	 return true
 }
