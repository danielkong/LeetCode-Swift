// 240. Search_a_2D_Matrix_II.swift
/*
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 For example,

 Consider the following matrix:
 [
 [1,   4,  7, 11, 15],
 [2,   5,  8, 12, 19],
 [3,   6,  9, 16, 22],
 [10, 13, 14, 17, 24],
 [18, 21, 23, 26, 30]
 ]

 Given target = 5, return true.

 Given target = 20, return false.
 */
/**
 * Question Link: https://leetcode.com/problems/search-a-2d-matrix-ii/description/
 * Primary idea: Start from last element at first row, then move downwards or backwards
 * Time Complexity: O(m + n), Space Complexity: O(1)
 */

class Search2DMatrixII {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return false
        }

        var col = matrix[0].count - 1
        var row = 0

        while (col >= 0 && row < matrix.count) {
            if target == matrix[row][col] {
                return true
            } else if target < matrix[row][col] {
                col -= 1
            } else if target > matrix[row][col] {
                row += 1
            }
        }

        return false
    }
}
