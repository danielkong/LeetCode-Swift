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