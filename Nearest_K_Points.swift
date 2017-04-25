// K closest points to a starting point in cartesian plane

/**
Given a set of points in a cartesian plane, and a start point , find the k closest points to the starting point.

Points = [(1,2),(2,3),(4,6),(7,9)]
Start Point = (2,2)

Find 2 closest points to start point.

https://discuss.leetcode.com/topic/101/k-closest-points-to-a-starting-point-in-cartesian-plane
*/

// Solution: Java

Naive Thinking: 第一反应用heap，用一个map把距离和点映射起来，全部装入之后往外推出k次。这里可能会出现相同距离的，所以map应该是一个Map<Double, List<Point>>的形式。也可以直接构建一个Point的comparator，这样似乎方便点。

 算法复杂度是O(nlogn)，日，我一开始以为是O(n)，要是面试问到就傻了。这和sorting是一样的。后面看到别人说的更好的方法。

class Point{
    int x, y;
    Point(int a,int b){
        x = a;
        y = b;
    }
    public String toString(){
        return "("+Integer.toString(x)+","+Integer.toString(y)+")";
    }
}

public List<Point> kNearestToOrigin(List<Point> set, int k){
        Comparator<Point> comparator = new Comparator<Point>(){
            @Override
            public int compare(Point a, Point b){
                if(Math.pow(a.x,2)+Math.pow(a.y,2) > Math.pow(b.x,2)+Math.pow(b.y,2))
                    return 1;
                else if(Math.pow(a.x,2)+Math.pow(a.y,2) < Math.pow(b.x,2)+Math.pow(b.y,2))
                    return -1;
                else
                    return 0;
            }
        };
        List<Point> rlst = new ArrayList<Point>();
        PriorityQueue<Point> heap = new PriorityQueue<Point>(set.size(), comparator);
        heap.addAll(set);
        for(int i = 0;i < k && i < set.size();i++)
            rlst.add(heap.poll());
        return rlst;
    }

Improved Way:这个由于看了网上别人说的有O(nlogk)，觉得自己好弱。当推进k个后，因为heap可以知道k个里最大的max，不断的用这个max跟剩下n-k个进行比较
如果大于max，说明该数至少比k个数大，舍去之。
如果小于max，说明该数这个max至少比k个数大，poll()掉这个max，push进该数。
如果等于max，两种做法都可以，舍去比较省力。
最后剩在heap里就是最小的k个了。

这样算法复杂度就是O(nlogk)

public List<Point> kNearestToOrigin(List<Point> set, int k){
        Comparator<Point> comparator = new Comparator<Point>(){
            @Override
            public int compare(Point a, Point b){
                if(Math.pow(a.x,2)+Math.pow(a.y,2) > Math.pow(b.x,2)+Math.pow(b.y,2))
                    return -1;
                else if(Math.pow(a.x,2)+Math.pow(a.y,2) < Math.pow(b.x,2)+Math.pow(b.y,2))
                    return 1;
                else
                    return 0;
            }
        };
        List<Point> rlst = new ArrayList<Point>();
        PriorityQueue<Point> heap = new PriorityQueue<Point>(set.size(), comparator);
        for(int i = 0;i < k && i < set.size();i++)
            heap.add(set.get(i));
        for(int i = k;i < set.size();i++){
            if(comparator.compare(set.get(i),heap.peek()) > 0){
                heap.poll();
                heap.add(set.get(i));
            }
        }
        while(!heap.isEmpty()){
            rlst.add(heap.poll());
        }
        return rlst;
    }
}}

//Find the K closest points to the origin(0,0) in a 2D plane, given an array containing N points.
/*
public class Point {
    public int x;
    public int y;
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
}
*/
public List<Point> findKClosest(Point[] p, int k) {
	//initial capacity and comparator
	PriorityQueue<Point> pq = new PriorityQueue<Point>(10, new Comparator<Point>(){
		@Override
		public int compare(Point a, Point b){
			//升序排列
			return (b.x*b.x+b.y*b.y)-(a.x*a.x+a.y*a.y);
		}
	});
	//maintain k smallest Point in the PriorityQueue
	for(int i=0;i<p.length;i++){
		if(i<k){
			pq.off(p[i]);
		}else{
			Point temp = pq.peak();
			if((p[i].x*p[i].x+p[i].y*p[i].y)-(temp.x*temp.x+temp.y*temp.y) < 0){
				pq.poll();
				pq.offer(p[i]);
			}
		}
	}
	List<Point> resultLst = new ArrayList<Point>();
	while(!pq.isEmpty()){
		resultLst.add(pq.poll());
	}
	return resultLst;
}
