// 191. Number of 1 Bits

// Primary Idea: Bit Manipulation
// Runtime: O()
// Swift
private func hammingWeight(_ n: UInt) -> Int {
    var bits = 0
    var mask: UInt = 1
    for _ in 0 ..< 32 {
        if (n & mask) != 0 {
            bits += 1
        }
        mask <<= 1
    }
    return bits
}

let res = hammingWeight(12)

// Java

public class Solution {
    // you need to treat n as an unsigned value
    public int hammingWeight(int n) {
        int count = 0;
        while (n != 0) {
            count += n & 1;
            n >>>= 1;
        }
        return count;
    }
}
