// 71        Simplify Path        24.0%        Medium        
/**
Given an absolute path for a file (Unix-style), simplify it.

For example,
path = "/home/", => "/home"
path = "/a/./b/../../c/", => "/c"
*/

/**
 * Question Link: https://leetcode.com/problems/simplify-path/
 * Primary idea: Use a stack, normal to push, .. to pop 
 * Time Complexity: O(n), Space Complexity: O(n)
 */

    ///     let numbers = [1, 2, 3, 4]
    ///     let addTwo: (Int, Int) -> Int = { x, y in x + y }
    ///     let numberSum = numbers.reduce(0, addTwo)
    ///     // 'numberSum' == 10

func simplifyPath(_ path: String) -> String {
    let dirs = path.components(separatedBy: "/")
    var stack = [String]()
    
    for dir in dirs {
        if dir == "." || dir == "" {
            continue
        } else if dir == ".." {
            if !stack.isEmpty {
                stack.removeLast()
            }
        } else {
            stack.append(dir)
        }
    }
    
    var result = ""
    guard stack.count > 0 else {
        return "/"
    }
    
    for path in stack {
        result += "/\(path)"
    }
    
    return result
    
//    let res = stack.reduce("") { total, dir in "\(total)/\(dir)" }   
//    return res.isEmpty ? "/" : res
}