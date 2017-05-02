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