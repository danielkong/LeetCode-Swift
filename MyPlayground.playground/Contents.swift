//: Playground - noun: a place where people can play

import Foundation
//public class Interval {
//    public var start: Int
//    public var end: Int
//    public init(_ start: Int, _ end: Int) {
//        self.start = start
//        self.end = end
//    }
//}
//func merge(_ intervals: [Interval]) -> [Interval] {
//    guard intervals.count > 1 else { return intervals }
//    let sortedIntervals = intervals.sorted{ $0.start < $1.start }
//    for i in sortedIntervals {
//        print(i.start, i.end)
//    }
//
//    var starts = [Int]()
//    var ends = [Int]()
//
//    for interval in sortedIntervals {
//        starts.append(interval.start)
//        ends.append(interval.end)
//    }
//
//
//    var res = [Interval]()
//    var tempStart = starts[0]
//    var tempEnd = ends[0]
//    for i in 1..<sortedIntervals.count {
//        print(i)
//        if starts[i] <= tempEnd {
//            // merge
//            // update merged end time
//            tempEnd = max(ends[i], tempEnd)
//            print(tempEnd)
//        } else {
//            print("~~")
//            res.append(Interval(tempStart, tempEnd))
//            tempStart = starts[i]
//            tempEnd = ends[i]
//        }
//        if i == sortedIntervals.count-1 {
//            res.append(Interval(tempStart, tempEnd))
//        }
//    }
//    return res
//}
//let res = merge([Interval(2,3),Interval(4,5),Interval(6,7),Interval(8,9),Interval(1,10)])
//print(res)
let test = Array("string")
for t in test {
    if t == "t" {
        print("~~~")
    }
}
print(test)

