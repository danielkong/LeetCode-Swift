// 452. Minimum Number of Arrows to Burst Balloons <Google>
/**
There are a number of spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice. Start is always smaller than end. There will be at most 104 balloons.

An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps travelling up infinitely. The problem is to find the minimum number of arrows that must be shot to burst all balloons.

Example:

Input:
[[10,16], [2,8], [1,6], [7,12]]

Output:
2

Explanation:
One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at  x = 11 (bursting the other two balloons).
*/
/**
    Solution: sorted by end points, then could for loop. 
            Two cases needs handle, curr item start smaller than prev end, means both with 1 arrow, 
            otherwise, need another arrow, then update prev arrow end.
    Runtime: O(nlogN) -- sort
    Space: O(N)
*/

// Solution 1: sorted by start point ascend [1,8], [2,6], need consider three cases, one non-intersection, intersection and one cover next one. not best solution

    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 0 else {
            return 0
        }
        var arr = points.sorted(){ $0[0] < $1[0] }
        
        var res = 1
        var tempend = arr[0][1]
        for item in arr {
            if item[0] > tempend {
                res += 1
                tempend = item[1]
            } else if item[1] < tempend {
            	tempend = point[1]
            }
        }
        return res
    }

// Best Solution 2: sorted by end point ascend [2,6], [1,8] Only consider one case to increase count (next one start point larger than current end point)
    // Time O(nlog(n)) <sort>, Space: O(n)<swift>, O(1)<Java>
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 0 else { return 0 }
        var sortedPoints = points.sorted{ $0[1] < $1[1] }
        var arrowPos = sortedPoints[0][1]
        var count = 1 
        for i in 1..<sortedPoints.count {
            if sortedPoints[i][0] <= arrowPos {
                continue
            }
            count += 1
            arrowPos = sortedPoints[i][1]
        }
        return count
    }