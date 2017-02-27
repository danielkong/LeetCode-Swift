// 286        Walls and Gates         42.3%        Medium        

/**
You are given a m x n 2D grid initialized with these three possible values.

-1 - A wall or an obstacle.
0 - A gate.
INF - Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

For example, given the 2D grid:
INF  -1  0  INF
INF INF INF  -1
INF  -1 INF  -1
  0  -1 INF INF
After running your function, the 2D grid should be:
  3  -1   0   1
  2   2   1  -1
  1  -1   2  -1
  0  -1   3   4
*/

/**
 * Question Link: https://leetcode.com/problems/walls-and-gates/
 * Primary idea: Classic Depth-first Search, go up, down, left, right four directions
 * 
 * Note: Start from gate to ease complexity, update distance correspondingly
 * Time Complexity: O((mn)^2), Space Complexity: O(1)
 *
 */


func wallsAndGates(_ rooms: inout [[Int]]) {
    let timeAtPress = Date()
    guard rooms.count > 0 && rooms[0].count > 0 else {
        return
    }
    
    let m = rooms.count
    let n = rooms[0].count
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            if rooms[i][j] == 0 {
                dfs(&rooms, i, j, m, n, 0)
            }
        }
    }
    let elapsed = Date().timeIntervalSince(timeAtPress) // 0.03764301538467407
    print(rooms)
}

func dfs(_ rooms: inout [[Int]], _ i: Int, _ j: Int, _ m: Int, _ n: Int, _ distance: Int) {
    guard i >= 0 && i < m && j >= 0 && j < n else {
        return
    }
    
    if distance == 0 || distance < rooms[i][j] {
        rooms[i][j] = distance
        dfs(&rooms, i + 1, j, m, n, distance + 1)
        dfs(&rooms, i - 1, j, m, n, distance + 1)
        dfs(&rooms, i, j + 1, m, n, distance + 1)
        dfs(&rooms, i, j - 1, m, n, distance + 1)
    }
}
var test = [[Int.max, -1, 0, Int.max], [Int.max, Int.max, Int.max, -1], [Int.max, -1, Int.max, -1], [0, -1, Int.max,  Int.max]]

wallsAndGates(&test)

func wallsAndGates2(_ rooms: inout [[Int]]) {
    let timeAtPress = Date()
    guard rooms.count > 0 && rooms[0].count > 0 else {
        return
    }
    
    let m = rooms.count
    let n = rooms[0].count
    
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            if rooms[i][j] == 0 {
                dfs2(&rooms, i, j, m, n, 0, &visited)
            }
        }
    }
    let elapsed = Date().timeIntervalSince(timeAtPress) // 0.001471996307373047
    print(rooms)
}
func dfs2(_ rooms: inout [[Int]], _ i: Int, _ j: Int, _ m: Int, _ n: Int, _ distance: Int, _ visited: inout [[Bool]]) {
    guard i >= 0 && i < m && j >= 0 && j < n else {
        return
    }
    
    if (distance == 0 || distance < rooms[i][j]) && !visited[i][j] {
        rooms[i][j] = distance
        dfs2(&rooms, i + 1, j, m, n, distance + 1, &visited)
        dfs2(&rooms, i - 1, j, m, n, distance + 1, &visited)
        dfs2(&rooms, i, j + 1, m, n, distance + 1, &visited)
        dfs2(&rooms, i, j - 1, m, n, distance + 1, &visited)
    }
}

wallsAndGates2(&test)

// BFS (find nearest 0, and give the distance)

var visited = Array(count: m, repeatedValue: Array(count: n, repeatedValue: false))
// BFS
class Solution {
public:
    void wallsAndGates(vector<vector<int>>& rooms) {
        queue<pair<int, int>> q;
        vector<vector<int>> dirs{{0, -1}, {-1, 0}, {0, 1}, {1, 0}};
        for (int i = 0; i < rooms.size(); ++i) {
            for (int j = 0; j < rooms[i].size(); ++j) {
                if (rooms[i][j] == 0) q.push({i, j});   
            }
        }
        while (!q.empty()) {
            int i = q.front().first, j = q.front().second; q.pop();
            for (int k = 0; k < dirs.size(); ++k) {
                int x = i + dirs[k][0], y = j + dirs[k][1];
                if (x < 0 || x >= rooms.size() || y < 0 || y >= rooms[0].size() || rooms[x][y] < rooms[i][j] + 1) continue;
                rooms[x][y] = rooms[i][j] + 1;
                q.push({x, y});
            }
        }
    }
};
