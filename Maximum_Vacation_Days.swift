// Maximum Vacation Days
/**
http://www.1point3acres.com/bbs/thread-202732-1-1.html
最大假期问题
input: .
a. 有n个城市， 每个城市之间有飞行时间，
b. 给个飞行时间，
c. 给个vacation array, 代表每个城市每周的假期。
d. 从第一个城市开始

意思就是每个周你可以呆在一个城市， 然后享受那个城市的假期。
还有个限制， 就是城市与城市之间的飞行时间不能超过给定的飞行时间
output:
求x weeks 你能享受到的最大假期总和
你自己设计输入的数据结构.
	  B
 6 /  |   \ 7
  A	  |	   D	(A-D 50)
 2 \  |20 / 10
      C
		A B C D
Week1	2 1 1 0
Week2	0 1 1 0
Week3	3 0 1 2
http://www.1point3acres.com/bbs/thread-147554-1-1.html
公司有很多office，你可以每周末飞到别的office。只有在比某个数字小的hours内能飞到才可以飞。每个office有很多假期。怎样获得一年内最多的假期
*/
// Solution Java online:
private static int helper(int[][] vacation, int[][] distance, int startCity, int maxTravelTime) {
		int numOfWeek = vacation.length;
		int numOfCity = vacation[0].length;
		int[][] days = new int[numOfWeek][numOfCity];
		days[0][0] = 2;
		int max = 0;
		for (int i = 1; i < numOfWeek; i++) {
				for (int j = 0; j < numOfCity; j++) {
						for (int k = 0; k < numOfCity; k++) {  // flying from k to j
								if (distance[k][j] <= maxTravelTime && distance[k][j] >= 0) {. From 1point 3acres bbs
										days[i][j] = Math.max(days[i][j], days[i - 1][k] + vacation[i][j]);
								}
						}
				}
		}
		for (int i = 0; i < numOfCity; i++) {
				max = Math.max(days[numOfWeek - 1][i], max);
		}
		return max;
}

public static void main(String[] args) {.鏈枃鍘熷垱鑷�1point3acres璁哄潧
		int[][] vacation = {{2,1,1,0},{0, 1, 1, 0},{3, 0, 1, 2}};. Waral 鍗氬鏈夋洿澶氭枃绔�,
		int[][] distance = {{0, 6, 2, 50}, {6, 0, 20, 7}, {2, 20, 0, 10}, {50, 7, 10, 0}};
		int res = helper(vacation, distance, 0, 10);
		System.out.println(res);
}
