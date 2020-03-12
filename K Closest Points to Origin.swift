// 973. K Closest Points to Origin
/**
We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

(Here, the distance between two points on a plane is the Euclidean distance.)

You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)

 

Example 1:

Input: points = [[1,3],[-2,2]], K = 1
Output: [[-2,2]]
Explanation: 
The distance between (1, 3) and the origin is sqrt(10).
The distance between (-2, 2) and the origin is sqrt(8).
Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
Example 2:

Input: points = [[3,3],[5,-1],[-2,4]], K = 2
Output: [[3,3],[-2,4]]
(The answer [[-2,4],[3,3]] would also be accepted.)
 

Note:

1 <= K <= points.length <= 10000
-10000 < points[i][0] < 10000
-10000 < points[i][1] < 10000
*/
/**
 Solution: 1. sort the point distances, and find Kth distance value. Then for loop again to save smaller than kth value distance.
 Time complexity: O(NlogN)
 
           2. MinHeap O(NlogK) since K is constant, so, O(N)

           3. Divide and Conquer
           Quick Selection sort, find a pivot element then split into two buckets.

*/

class Solution {
    var points = [[Int]]()
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        let n = points.count
        var dists = Array(repeating: 0, count:n)
        
        for i in 0..<n {
            dists[i] = dist(points[i])
        }
        dists.sort()
        let kVal = dists[K-1]
        
        var res = Array(repeating:Array(repeating:0, count:2), count:K)
        var t = 0
        for i in 0..<n {
            if dist(points[i]) <= kVal {
                res[t] = points[i]
                t += 1
            }
        }
        return res
    }
    
    private func dist(_ point:[Int]) -> Int {
        return  point[0] * point[0] + point[1]*point[1]
    }
}


class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
      var low = 0
      var high = points.count - 1
      var k = K - 1
      var points = points
      return quickSelect(&points, low, high, k)  
    }
  
    func quickSelect(_ points: inout [[Int]], _ low: Int, _ high: Int, _ k: Int) -> [[Int]] {
      var l = low
      var r = high
      while l <= r {
        let index = partition(&points, l, r)
        if index == k {
          return Array(points[0...k])
        } else if index > k {
          r = index - 1 
        } else {
          l = index + 1
        }
      }
      return []
    }
    private func partition(_ points: inout [[Int]], _ low: Int, _ high: Int) -> Int {
      var l = low
      var r = high
      let mid = l + (r - l) / 2
      let midVal = distance(points[mid])
      swap(&points, mid, high) 
      var p = low
      for i in low..<high {
        if distance(points[i]) <= midVal {
          swap(&points, i, p)
          p += 1
        }
      }
      swap(&points, p, high) 
      return p
    }
    func swap(_ points: inout [[Int]], _ i: Int, _ j: Int) {
      let tmp = points[i]
      points[i] = points[j]
      points[j] = tmp
    }
    func distance(_ p: [Int]) -> Int {
      return p[0] * p[0] + p[1] * p[1]
    }
}