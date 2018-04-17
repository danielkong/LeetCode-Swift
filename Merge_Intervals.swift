// 56        Merge Intervals        28.3%        Hard        
/**
Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].
*/

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
