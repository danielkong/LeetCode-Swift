// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
// input: 1
// output" ["()"] // ")("
// input: 2
// output: ["(())","()()"] // "))((, )()("
// input 3
// ["((()))","(())()","(()())","()(())","()()()"]


// [backtracking]

    var results: [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        
        backtrack("", n, n)
        return results
    }

    func backtrack(_ current: String, _ left: Int, _ right: Int) {
        if left == 0 && right == 0 {
            results.append(current)
        }
        if left > 0 {
            backtrack(current.appending("("), left - 1, right)
        }
        if right > left {
            backtrack(current.appending(")"), left, right - 1)
        }
    }
