// 149. Max Points on a Line
/**
Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.
*/
/**
Primary Idea:
Runtime: O(n^2), Space: O(n)
*/
public class Point {
    var x: Int
    var y: Int

    public init(_ xVal: Int, _ yVal: Int) {
        x = xVal
        y = yVal
    }
}

public func maxPoints(_ points: [Point]) -> Int {
    guard points.count > 2 else {
        return points.count
    }
    var dict: [Double: Int] = Dictionary()
    var maxNum = 0
    for i in 0 ..<  points.count {
        dict = [:]
        dict[Double(Int.min)] = 1
        var dup = 0
        for j in i+1 ..< points.count {
            if points[j].x == points[i].x && points[j].y == points[i].y {
                dup += 1
                continue
            }
            let key: Double = points[j].x - points[i].x == 0 ? Double(Int.max) : Double(Double(points[j].y - points[i].y) / Double(points[j].x - points[i].x))
            if dict[key] != nil {
                dict[key]! += 1
            } else {
                dict[key] = 2
            }
        }
        for temp in dict.values {
            maxNum = max(maxNum, temp + dup)
        }
    }
    return maxNum
}

let points = [Point(1,1), Point(2,2), Point(3,3), Point(2,3), Point(4,6), Point(6,9), Point(8,12), Point(2,2), Point(2,2)]
let res = maxPoints(points)
