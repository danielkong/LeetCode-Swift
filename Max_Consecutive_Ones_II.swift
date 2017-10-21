// 487. Max Consecutive Ones II
/**
Given a binary array, find the maximum number of consecutive 1s in this array if you can flip at most one 0.

Example 1:
Input: [1,0,1,1,0]
Output: 4
Explanation: Flip the first zero will get the the maximum number of consecutive 1s.
    After flipping, the maximum number of consecutive 1s is 4.
Note:

The input array will only contain 0 and 1.
The length of input array is a positive integer and will not exceed 10,000

Follow up:
What if the input numbers come in one by one as an infinite stream?
In other words, you can't store all numbers coming from the stream as it's too large to hold in memory.
Could you solve it efficiently?
*/

// Solution Swift: Two Pointer.
// Time O(n), Space O(1)

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var prevOnes = 0, currentOnes = 0, res = 0
        for num in nums {
            currentOnes += 1
            if num == 0 {
                prevOnes = currentOnes
                currentOnes = 0
            }
            res = max(res, prevOnes+currentOnes)
        }
        return res
    }
}

// How about if k flips for zero.
// Time: O(n) Space: O(k) Java Solution
    public int findMaxConsecutiveOnes(int[] nums) {                 
        int max = 0, k = 1; // flip at most k zero
        Queue<Integer> zeroIndex = new LinkedList<>();
        for (int l = 0, h = 0; h < nums.length; h++) {
            if (nums[h] == 0)
                zeroIndex.offer(h);
            if (zeroIndex.size() > k)
                l = zeroIndex.poll() + 1;
            max = Math.max(max, h - l + 1);
        }
        return max;
    }
