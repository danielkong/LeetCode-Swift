//: Playground - noun: a place where people can play

import UIKit
import Dispatch

var str = "Hello, playground"

func solve(_ board: inout [[Character]]) {
    guard board.count > 0 else { return }
    let row = board.count
    let col = board[0].count
    if col == 0 { return }
    
    for i in 0..<row {
        for j in 0..<col {
            print("1")
            if i == 0 || i == row-1 || j == 0 || j == col-1 {
                continue
            } else {
                print("12")

                if board[i][j] == Character("O") && checkSurroundsO(&board, i, j) {
                    continue
                    print("123")

                } else {
                    board[i][j] = Character("X")
                }
            }
        }
    }
}

func checkSurroundsO(_ board: inout [[Character]], _ i: Int, _ j: Int) -> Bool {

    
    if (i == 0 || i == board.count-1) && board[i][j] == Character("O") {
        return true
    }
    if (j == 0 || j == board[0].count-1) && board[i][j] == Character("O") {
        return true
    } else if i < 0 || j < 0 || i >= board.count || j >= board[0].count {
        return false
    }
    if (checkSurroundsO(&board, i-1, j) || checkSurroundsO(&board, i+1, j) || checkSurroundsO(&board, i, j-1) || checkSurroundsO(&board, i, j+1)) {
        return true
    }
    return false
}


var test: [[Character]] = [["X","X","X"],["X","O","X"],["X","O","X"]]

solve(&test)
print(test)



