// 621. Task Scheduler
/**
 Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks.Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.
 
 However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.
 
 You need to return the least number of intervals the CPU will take to finish all the given tasks.
 
 Example 1:
     Input: tasks = ["A","A","A","B","B","B"], n = 2
     Output: 8
     Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
 Note:
     The number of tasks is in the range [1, 10000].
     The integer n is in the range [0, 100].
 */
/**
 Solution 1: Updating map every task execution, greedy fill task one by one.
Time O(time)
Space O(1)  Constant size array map is used.

 Solution 2: Better and faster. Max count task needs (maps[25]-1)*(n+1) to finish, 
            if has same max count tasks, need to add those task number as well (25 - i), 
            then compare those with tasks.count
Time complexity : O(n). We iterate over taskstasks array only once. (O(n)).Sorting taskstasks array of length n takes O\big(26log(26)\big)= O(1) time. After this, only one iteration over 26 elements of mapmap is done(O(1).
Space complexity : O(1). mapmap array of constant size(26) is used.



 Meanwhile, also could use priority queue, use Max-Heap(queue) to pick the order or tasks.

Solution 3: Priority Queue -- max heap
Time complexity : O(n). Number of iterations will be equal to resultant time timetime.
Space complexity : O(1). queuequeue and temptemp size will not exceed O(26).
 */
// Solution 1
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  var map = Array(repeating: 0, count:26)
  tasks.forEach { map[Int($0.asciiValue! - Character("A").asciiValue!)] += 1 }

  map.sort()
  var time = 0
  while map[25] > 0 {
      var i = 0
      while i <= n {
          if map[25] == 0 {
              break
          }
          if i < 26 && map[25-i] > 0 {
              map[25-i] -= 1
          }
          time += 1
          i += 1
      }
      map.sort()
  }
  return time
}

// solution 2
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var map = Array(repeating: 0, count:26)
    tasks.forEach { map[Int($0.asciiValue! - Character("A").asciiValue!)] += 1 }

    map.sort()
    var i = 25
    while i >= 0 && map[i] == map[25] {
      i -= 1
    }
    return max(tasks.count, (map[25] - 1) * (n + 1) + 25 - i)
}

// Solution 3 priority queue
public class Solution {
    public int leastInterval(char[] tasks, int n) {
        int[] map = new int[26];
        for (char c: tasks)
            map[c - 'A']++;
        PriorityQueue < Integer > queue = new PriorityQueue < > (26, Collections.reverseOrder());
        for (int f: map) {
            if (f > 0)
                queue.add(f);
        }
        int time = 0;
        while (!queue.isEmpty()) {
            int i = 0;
            List < Integer > temp = new ArrayList < > ();
            while (i <= n) {
                if (!queue.isEmpty()) {
                    if (queue.peek() > 1)
                        temp.add(queue.poll() - 1);
                    else
                        queue.poll();
                }
                time++;
                if (queue.isEmpty() && temp.size() == 0)
                    break;
                i++;
            }
            for (int l: temp)
                queue.add(l);
        }
        return time;
    }
}


// initial solution

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    // var dict = [Character: Int]()
    // since character only from A to Z.
    var dict = Array(repeating: 0, count: 26)
    var maxCount = Int.min
    
    for task in tasks {
        let str = String(task)
        dict[Int(str.utf8.first!) - Int("A".utf8.first!)] += 1
    }
    
    var sortedArray = dict.sorted{ $0 > $1 }
    
    var maxLetterCount = 1
    for i in 0..<25 {
        if sortedArray[i] == sortedArray[i+1] {
            
        } else {
            maxLetterCount += i
            break
        }
    }
    return max(tasks.count, (sortedArray[0]-1)*(n+1) + maxLetterCount)
}

// Task Scheduler

/**
Task Scheduler
   就是加空格, 返回加完空格后的长度
   Example: 
              Sequence - AABBCCDD
              Cooling interval - 2
              A_ _AB_ _BC_ _CD_ _D => 16

              ABABA => cooling - 3
              A_ _BA
              AB_ _AB => 6


           public int getMinScheduleTime(char[] sequence, int cooling) {

           } 
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=275570

http://www.1point3acres.com/bbs/thread-275657-1-1.html
用O(K)的空间，时间仍然是O(N)
*/

public func getMinScheduleTime(_ sequence: [Character], _ cooling: Int) -> Int {
    var dict = [Character: Int]()
    var timer = 0
    for ch in sequence {
        timer += 1
        if let val = dict[ch] {
            if val + cooling >= timer {
                timer = val + cooling + 1
            }
        }
        dict[ch] = timer
    }
    return timer
}

let t = Array("ABAB".characters)
let testing = getMinScheduleTime(t, 3) // 6
let t = Array("ABABB".characters)
let testing = getMinScheduleTime(t, 3) // 10
