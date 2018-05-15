// 149. Max Points on a Line
/**
Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.
*/
/**
 Idea:
    Before handle general slope, think about 
    1. General slope
    2. Same point
    3. Two points x is same

    res = 0
    two for loop { dict.clearAll(), dups = 0, tempmax = 0 for i+1..<count{ dup+=1,slope, slop as Int.max, tempmax = max(tempmax,dict[slope]) } res=max(res, max+dups+1)} 


Runtime: O(n^2)
 Space: O(n)

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
    var dict = [Double: Int]()
    var maxNum = 0
    for i in 0 ..< points.count {
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


// Java Best Solution: 
// Hard to understand
/**
 * Definition for a point.
 * class Point {
 *     int x;
 *     int y;
 *     Point() { x = 0; y = 0; }
 *     Point(int a, int b) { x = a; y = b; }
 * }
 */
public class Solution {
    public int maxPoints(Point[] points) {
        if (points==null) return 0;
        if (points.length<=2) return points.length;

        Map<Integer,Map<Integer,Integer>> map = new HashMap<Integer,Map<Integer,Integer>>();
        int result=0;
        for (int i=0;i<points.length;i++){ 
            map.clear();
            int overlap=0,max=0;
            for (int j=i+1;j<points.length;j++){
                int x=points[j].x-points[i].x;
                int y=points[j].y-points[i].y;
                if (x==0&&y==0){
                    overlap++;
                    continue;
                }
                int slope=generateGCD(x,y);
                if (slope!=0){
                    x/=slope;
                    y/=slope;
                }

                if (map.containsKey(x)){
                    if (map.get(x).containsKey(y)){
                        map.get(x).put(y, map.get(x).get(y)+1);
                    }else{
                        map.get(x).put(y, 1);
                    }                       
                }else{
                    Map<Integer,Integer> m = new HashMap<Integer,Integer>();
                    m.put(y, 1);
                    map.put(x, m);
                }
                max=Math.max(max, map.get(x).get(y));
            }
            result=Math.max(result,  +overlap+1);
        }
        return result;


    }
    private int generateGCD(int x,int y){
        if (y==0) return x;
        else return generateGCD(y,x%y);

    }
}

// Java Solution:
// Failed on last one, very long float diff slope value 
public class Solution {
    public int maxPoints(Point[] points) {
        if(points.length <= 0) return 0;
        if(points.length <= 2) return points.length;
        int result = 0;
        for(int i = 0; i < points.length; i++){
            HashMap<Double, Integer> hm = new HashMap<Double, Integer>();
            int samex = 1;
            int samep = 0;
            for(int j = 0; j < points.length; j++){
                if(j != i){
                    if((points[j].x == points[i].x) && (points[j].y == points[i].y)){
                        samep++;
                    }
                    if(points[j].x == points[i].x){
                        samex++;
                        continue;
                    }
                    double k = (double)(points[j].y - points[i].y) / (double)(points[j].x - points[i].x);
                    if(hm.containsKey(k)){
                        hm.put(k,hm.get(k) + 1);
                    }else{
                        hm.put(k, 2);
                    }
                    result = Math.max(result, hm.get(k) + samep);
                }
            }
            result = Math.max(result, samex);
        }
        return result;
    }
}
