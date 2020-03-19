// 636. Exclusive Time of Functions -- medium
/**
On a single threaded CPU, we execute some functions.  Each function has a unique id between 0 and N-1.

We store logs in timestamp order that describe when a function is entered or exited.

Each log is a string with this format: "{function_id}:{"start" | "end"}:{timestamp}".  For example, "0:start:3" means the function with id 0 started at the beginning of timestamp 3.  "1:end:2" means the function with id 1 ended at the end of timestamp 2.

A function's exclusive time is the number of units of time spent in this function.  Note that this does not include any recursive calls to child functions.

The CPU is single threaded which means that only one function is being executed at a given time unit.

Return the exclusive time of each function, sorted by their function id.

 

Example 1:
Input:
n = 2
logs = ["0:start:0","1:start:2","1:end:5","0:end:6"]
Output: [3, 4]
Explanation:
Function 0 starts at the beginning of time 0, then it executes 2 units of time and reaches the end of time 1.
Now function 1 starts at the beginning of time 2, executes 4 units of time and ends at time 5.
Function 0 is running again at the beginning of time 6, and also ends at the end of time 6, thus executing for 1 unit of time. 
So function 0 spends 2 + 1 = 3 units of total time executing, and function 1 spends 4 units of total time executing.
 

Note:

1 <= n <= 100
Two functions won't start or end at the same time.
Functions will always log when they exit.
*/
/**
    Solution: Stack, if start do something, if end calcualte time
*/
class Solution {
    
struct MT {
    var idx: Int
    var sTime: Int
    var cost: Int
}

func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
    var stack: [MT] = []
    var res: [Int] = Array(repeating:0, count: n)
    
    for s in logs {
        let parts = s.split(separator: ":")
        let idx = Int(String(parts[0]))!
        let sTime = Int(String(parts[2]))!
        let isStart = (String(parts[1]) == "start")
        
        if stack.count == 0 {
            stack.append(MT(idx:idx,sTime:sTime,cost:0))
            // print(stack)
            continue
        }
        if isStart {
            var last = stack.removeLast()
            last.cost += (sTime - last.sTime)
            stack.append(last)
            stack.append(MT(idx:idx,sTime:sTime,cost:0))
            // print(stack)
            continue
        }
        
        var last = stack.removeLast()
        last.cost += (sTime - last.sTime + 1)
        res[last.idx] += last.cost
        
        if stack.count > 0 {
            last = stack.removeLast()
            last.sTime = (sTime + 1)
            stack.append(last)
        }
        // print(stack)
        // print(res)
    }

    return res
}
}

// same solution
class Solution {
    // [0,0] [1,2] [1,5] [2,6] [2,9] [0,12]
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var res = Array(repeating: 0, count: n)
        var stack = Array<Int>()
        
        let arr0 = logs[0].components(separatedBy:":")
        stack.append(Int(arr0[0])!)
        var prev = Int(arr0[2])!
        var i = 1
        let logCount = logs.count
        while i < logCount {
            let arr = logs[i].components(separatedBy:":")
            if arr[1] == "start" {
                if stack.count > 0 {
                    res[stack.last!] += Int(arr[2])! - prev
                }
                stack.append(Int(arr[0])!)
                prev = Int(arr[2])!
            } else if arr[1] == "end" {
                res[stack.last!] += Int(arr[2])! - prev + 1
                stack.removeLast()
                prev = Int(arr[2])! + 1
            }
            i += 1
        }
        return res
    }
}