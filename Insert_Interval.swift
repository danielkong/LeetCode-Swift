// 57        Insert Interval        26.3%        Hard             
/**
Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

You may assume that the intervals were initially sorted according to their start times.

Example 1:
Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].

Example 2:
Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].

This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
*/

// Solution 1: Use merge interval function.
// Solution 2: Compare one by one.

    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        guard intervals.count > 0 else {
            return [newInterval]
        }
        var start = newInterval.start, end = newInterval.end
        var left = [Interval](), right = [Interval]()
        for i in intervals {
            if i.end < start {
                left.append(i)
            } else if i.start > end {
                right.append(i)
            } else {
                start = min(start, i.start)
                end = max(end, i.end)
            }
        }
        var res = left
        res.append(Interval(start, end))
        res += right
        return res
    }