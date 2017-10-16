// 305. Number of Islands II

/**A 2d grid map of m rows and n columns is initially filled with water. We may perform an addLand operation which turns the water at position (row, col) into a land. Given a list of positions to operate, count the number of islands after each addLand operation. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example:

Given m = 3, n = 3, positions = [[0,0], [0,1], [1,2], [2,1]].
Initially, the 2d grid grid is filled with water. (Assume 0 represents water and 1 >represents land).

0 0 0
0 0 0
0 0 0
Operation #1: addLand(0, 0) turns the water at grid0 into a land.

1 0 0
0 0 0   Number of islands = 1
0 0 0
Operation #2: addLand(0, 1) turns the water at grid0 into a land.

1 1 0
0 0 0   Number of islands = 1
0 0 0
Operation #3: addLand(1, 2) turns the water at grid1 into a land.

1 1 0
0 0 1   Number of islands = 2
0 0 0
Operation #4: addLand(2, 1) turns the water at grid2 into a land.

1 1 0
0 0 1   Number of islands = 3
0 1 0
We return the result as an array: [1, 1, 2, 3]
*/

// Union-Find: https://segmentfault.com/a/1190000004197552

分析
很典型的union-find题。因为这里是动态的增加land，要能随时求出有多少个island，最简单的方法就是union-find。我们可以定义一个counter, 每增加一个land, 增加counter, 然后我们搜索那个land邻居区域，发现root不一样的话，意味着可以union, 每union一次，意味着两个island合并成一个，减小counter, 统计最终的counter值，即是增加land后的最终island的个数。

为了减小时间复杂度，代码实现是QuickUnion + Path Compression, Path Compression目的是为了调整树的高度，保持很平的树，而不是越来越高，这样找root不会出现worst case.

复杂度
time: O(Mlog(N)), space: O(N)
M表示增加land的数量，N表示矩阵中点的个数即m*n。

代码
public class Solution {
    public List<Integer> numIslands2(int m, int n, int[][] positions) {
        int[] id = new int[m * n]; // 表示各个index对应的root

        List<Integer> res = new ArrayList<>();
        Arrays.fill(id, -1); // 初始化root为-1，用来标记water, 非-1表示land
        int count = 0; // 记录island的数量

        int[][] dirs = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
        for (int i = 0; i < positions.length; i++) {
            count++;
            int index = positions[i][0] * n + positions[i][1];
            id[index] = index; // root初始化

            for (int j = 0; j < dirs.length; j++) {
                int x = positions[i][0] + dirs[j][0];
                int y = positions[i][1] + dirs[j][1];
                if (x >= 0 && x < m && y >= 0 && y < n && id[x * n + y] != -1) {
                    int root = root(id, x * n + y);

                    // 发现root不等的情况下，才union, 同时减小count
                    if (root != index) {
                        id[root] = index;
                        count--;
                    }
                }
            }
            res.add(count);
        }
        return res;
    }

    public int root(int[] id, int i) {
        while (i != id[i]) {
            id[i] = id[id[i]]; // 优化，为了减小树的高度
            i = id[i];
        }
        return i;
    }
}
