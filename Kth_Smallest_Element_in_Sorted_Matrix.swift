// 378. Kth Smallest Element in a Sorted Matrix
/**
Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.

Note that it is the kth smallest element in the sorted order, not the kth distinct element.

Example:

matrix = [
   [ 1,  5,  9],
   [10, 11, 13],
   [12, 13, 15]
],
k = 8,

return 13.
Note: 
You may assume k is always valid, 1 ≤ k ≤ n2.
*/

    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else { return 0 }
        var indexArray = Array(repeating: 0, count: matrix.count)
        var k = k

        while k > 0 {
            // find smallest value and save rowNumber
            var smallRow = 0
            var smallValue = Int.max
            for i in 0..<matrix.count {
                if indexArray[i] < matrix[0].count {
                    if matrix[i][indexArray[i]] <= smallValue {
                        smallValue = min(smallValue, matrix[i][indexArray[i]])
                        smallRow = i
                    }    
                }
            }
            k -= 1
            if k == 0 {
                return matrix[smallRow][indexArray[smallRow]]
            }
            indexArray[smallRow] += 1

        }
        return 0
    }