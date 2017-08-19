// 48. Rotate Image
/*
You are given an n x n 2D matrix representing an image.

Rotate the image by 90 degrees (clockwise).

Follow up:
Could you do this in-place?

 * clockwise rotate
 * first reverse up to down, then swap the symmetry
 * 1 2 3     7 8 9     7 4 1
 * 4 5 6  => 4 5 6  => 8 5 2
 * 7 8 9     1 2 3     9 6 3
*/
/**
Primary Idea:
Runtime: 
*/

0,1 -> j,n-i -> n-i,n-j -> n-j,i

func rotate(_ matrix: inout [[Int]]) {
	let n = matrix.count
	// clockwise
	for i in 0 ..< n/2 {
		for j in i+1 ..< n-i {
			var temp = matrix[i][j]
			matrix[i][j] = matrix[n-j-1][i]
			matrix[n-j-1][i] = matrix[n-i-1][n-j-1]
			matrix[n-i-1][n-j-1] = matrix[j][n-i-1]
			matrix[j][n-i-1] = temp
		}
	}
}

// anti-clockwise
func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    // anti-clock
    for i in 0 ..< n/2 {
        for j in i+1 ..< n-i {
            var temp = matrix[i][j]
            matrix[i][j] = matrix[j][n-i-1]
            matrix[j][n-i-1] = matrix[n-i-1][n-j-1]
            matrix[n-i-1][n-j-1] = matrix[n-j-1][i]
            matrix[n-j-1][i] = temp
        }
    }
}
