// 56        Merge Intervals        28.3%        Hard        
/**
Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].
*/

/**
    Solution 1: Sort by start value.
                If res empty means  
    Solution 2: Sort by end value.
*/

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        guard intervals.count > 0 else {
            return []
        }
        
        // sort by start value
        var sorted = intervals
        sorted.sort { $0[0] < $1[0] }
        var merged: [[Int]] = []
        
        var last: [Int] = []
        for interval in sorted {
            if merged.isEmpty || interval[0] > last[1] {
                last = interval
                merged.append(last)
                continue
            } else if interval[1] > last[1] {
                // merge
                last[1] = interval[1]
                merged.removeLast()
                merged.append(last)
            }
        }
        
        return merged
    }

    // sorted by end value.
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        let sortedIntervals = intervals.sorted(){ $0[1] < $1[1] }
        var res: [[Int]] = [sortedIntervals[0]]
        var i = 0
        while i < sortedIntervals.count-1 {
            if sortedIntervals[i][1] < sortedIntervals[i+1][0] {
                // create new to res
                print(sortedIntervals[i+1])
                res.append(sortedIntervals[i+1])
            } else {
                // grap res.last, not only grap last,
                var temp = res.removeLast()
                while sortedIntervals[i+1][0] < temp[0] && res.count > 0 {
                    if let prev = res.last, sortedIntervals[i+1][0] <= prev[1] {
                        temp = res.removeLast()
                    } else {
                        break
                    }
                }
                print(sortedIntervals[i])
                res.append([min(temp[0], sortedIntervals[i+1][0]), max(temp[1], sortedIntervals[i+1][1])])

            }
            i += 1
        }
        return res
    }


func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else {
        return []
    }
    var sortedIntervals = intervals.sorted() {
        if $0.start != $1.start {
            return $0.start < $1.start
        } else {
            return $0.end < $1.end
        }
    }
    
    var res = [Interval]()
    res.append(sortedIntervals[0])
    for i in 1..<sortedIntervals.count {
        let last = res.last
        
        if (last?.end)! >= sortedIntervals[i].start {
            last?.end = max((last?.end)!, sortedIntervals[i].end)
        } else {
            res.append(sortedIntervals[i])
        }
    }
    for i in res {
        print(i.start)
        print(i.end)
    }

    return res
}

/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard intervals.count > 1 else { return intervals }
        let sortedIntervals = intervals.sorted{ $0.start < $1.start }
        var starts = [Int]()
        var ends = [Int]()
        
        for interval in sortedIntervals {
            starts.append(interval.start)
            ends.append(interval.end)
        }
        
        var res = [Interval]()
        var tempStart = starts[0]
        var tempEnd = ends[0]
        for i in 1..<sortedIntervals.count {
            if starts[i] <= tempEnd {
                // should merge
                // update merged end time
                tempEnd = max(ends[i], tempEnd)
            } else {
                // not overlap
                res.append(Interval(tempStart, tempEnd))
                tempStart = starts[i]
                tempEnd = ends[i]
            }
            // last one update
            if i == sortedIntervals.count-1 {
                res.append(Interval(tempStart, tempEnd))
            }
        }
        return res
    }
}
