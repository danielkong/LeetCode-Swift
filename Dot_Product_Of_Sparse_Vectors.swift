Dot Product Of Sparse Vectors | in Leetcode 	311. Sparse Matrix Multiplication

// sparse vector dot product。
// follow up: what if the number of nonzero elements of one vector is 10^10 and the other is 10^2, how can you make it faster?
// http://www.1point3acres.com/bbs/thread-117371-1-1.html
// 我是用的binary search，可以从O(max(m,n))降低到O(n*log(m)), where m = max(m,n)

/** A = [
  [ 1, 0, 0],
  [-1, 0, 3]
], so Am = 2, An = 3 = Bm, 
*/

// Navie Java Solution: Did not calculate element contain 0 multiplication, but still did not use index. So, Time: O(Am * An * Bn) Space O(Am * An * Bn)

public class Solution {
    public int[][] multiply(int[][] A, int[][] B) {
        int m = A.length, n = A[0].length, nB = B[0].length;
        int[][] C = new int[m][nB];

        for(int i = 0; i < m; i++) {
            for(int k = 0; k < n; k++) {
                if (A[i][k] != 0) {
                    for (int j = 0; j < nB; j++) {
                        if (B[k][j] != 0) C[i][j] += A[i][k] * B[k][j];
                    }
                }
            }
        }
        return C;   
    }
}

// Solution 参考 http://www.hawstein.com/posts/make-thiner-programming-pearls.html
// 200 * 200 矩阵, 里面只有2000个元素有值, 其它的都为0
// Solution 1. List with (index, val) 200个指针(colhead)和2000条记录(每条记录是两个整数和一个指针)， 占用空间是200x4B + 2000x12B = 24800B = 24.8KB
// Solution 2. Three arrays. 1, count non-zero # in first row; 2, index # in row; 3, val 该结构所需要的存储空间为2x2000x4B + 201x4B = 16804B = 16.8KB, since first array range(0, 200) 所以可以用一个short(或unsigned short)来保存. 2x2000x4B + 201*2B = 10.4KB

// Time avg: O(max(Am * An, Am * Bn)) worst(non-zero in one row) same as above.

public int[][] multiply(int[][] A, int[][] B) {
    int m = A.length, n = A[0].length, nB = B[0].length;
    int[][] result = new int[m][nB];

    List[] indexA = new List[m];
    for(int i = 0; i < m; i++) {
        List<Integer> numsA = new ArrayList<>();
        for(int j = 0; j < n; j++) {
            if(A[i][j] != 0){
                numsA.add(j); 
            }
        }
        indexA[i] = numsA;
    }

    for(int i = 0; i < m; i++) {
        List<Integer> numsA = indexA[i];
        for(int p = 0; p < numsA.size(); p++) {
            int colA = numsA.get(p);
            int valA = A[i][colA];
            for(int j = 0; j < nB; j ++) {
                int valB = B[colA][j];
                if (valB != 0) {
                    result[i][j] += valA * valB;
                }
            }
        }
    }

    return result;   
}
// https://www.careercup.com/question?id=5678837729853440
// Dot product
/**
The dot product of two vectors a = [a1, a2, ..., an] and b = [b1, b2, ..., bn] is defined as:

a.b = a1*b1 + a2*b2 + a3*b3 + ... + an*bn
{\displaystyle \mathbf {a} \cdot \mathbf {b} =\sum _{i=1}^{n}a_{i}b_{i}=a_{1}b_{1}+a_{2}b_{2}+\cdots +a_{n}b_{n}} {\displaystyle \mathbf {a} \cdot \mathbf {b} =\sum _{i=1}^{n}a_{i}b_{i}=a_{1}b_{1}+a_{2}b_{2}+\cdots +a_{n}b_{n}}
*/

// http://www.cnblogs.com/grandyang/p/5282959.html
/**
Given two sparse matrices A and B, return the result of AB.

You may assume that A's column number is equal to B's row number.

Example:

A = [
  [ 1, 0, 0],
  [-1, 0, 3]
]

B = [
  [ 7, 0, 0 ],
  [ 0, 0, 0 ],
  [ 0, 0, 1 ]
]


     |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
                  | 0 0 1 |

*/

