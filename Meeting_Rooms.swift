// 252        Meeting Rooms         45.3%        Easy   (lock)      
/**
 * Problem:

 * Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.

 * For example,
 * Given [[0, 30],[5, 10],[15, 20]],
 * return false.
 * Primary idea: Sort and traverse, find if any conflicts exist
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 *
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
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        guard intervals.count > 1 else { return true }
        var temp = intervals.sorted(){ $0.start < $1.start }
        var lastend = temp[0].end
        for i in 1 ..< temp.count {
            if temp[i].start < lastend {
                return false
            }
            lastend = temp[i].end
        }
        return true
    }
}



    func canAttendMeetings(intervals: [Interval]) -> Bool {
        guard intervals.count > 1 else {
            return true
        }

        var intervals = intervals.sort() {
            if $0.start != $1.start {
                return $0.start < $1.start
            } else {
                return $0.end < $1.end
            }
        }

        for i in 0 ..< intervals.count - 1 {
            if intervals[i].end > intervals[i + 1].start {
                return false
            }
        }

        return true
    }
