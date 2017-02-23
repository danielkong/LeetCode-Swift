// 79        Word Search        25.3%        Medium     

/**Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

For example,
Given board =

[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
*/
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        
        var visited = Array(repeating: Array(repeating:false, count: n), count: m)
        var content = Array(word.characters)
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == content[0] && dfs(board, content, 0, m, n, i, j, &visited) {
                    return true
                }
            }
        }
        return false
    }
    
    private func dfs(_ board: [[Character]], _ content:[Character], _ index: Int, _ max_m: Int, _ max_n: Int, _ i: Int, _ j: Int,  _ visited: inout [[Bool]]) -> Bool {
        if index == content.count {
            return true
        }
        
        guard i >= 0 && j >= 0 && i < max_m && j < max_n else {
            return false
        }
        
        guard !visited[i][j] && board[i][j] == content[index] else {
            return false
        }
        
        visited[i][j] = true
        
        if dfs(board, content, index + 1, max_m, max_n, i+1, j, &visited) ||
            dfs(board, content, index + 1, max_m, max_n, i-1, j, &visited) ||
            dfs(board, content, index + 1, max_m, max_n, i, j+1, &visited) ||
            dfs(board, content, index + 1, max_m, max_n, i, j-1, &visited) {
            return true
        }
        
        visited[i][j] = false
        
        return false
    }
}