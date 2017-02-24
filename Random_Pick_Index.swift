// 398        Random Pick Index        39.8%        Medium        

/**
Given an array of integers with possible duplicates, randomly output the index of a given target number. You can assume that the given target number must exist in the array.

Note:
The array size can be very large. Solution that uses too much extra space will not pass the judge.

Example:

int[] nums = new int[] {1,2,3,3,3};
Solution solution = new Solution(nums);

// pick(3) should return either index 2, 3, or 4 randomly. Each index should have equal probability of returning.
solution.pick(3);

// pick(1) should return 0. Since in the array only nums[0] is equal to 1.
solution.pick(1);
*/

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(nums);
 * int param_1 = obj.pick(target);
 */

// Solution: Java - use Randome Generator func
public class Solution {
    int[] nums;
    Random random;

    public Solution(int[] nums) {
        this.nums = nums;
        this.random = new Random();
    }
    
    public int pick(int target) {
        int result = -1;
        int count = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != target)
                continue;
            if (random.nextInt(++count) == 0)
                result = i;
        }
        
        return result;
    }
}

// Swift: Lol
public class Solution {
    let nums: [Int]
    var potential_idxs = [Int]()
    public init(_ nums: [Int]) {
        self.nums = nums
    }
    public func pick(_ target: Int) -> Int {
        for (i, num) in nums.enumerated() {
            if num == target {
                potential_idxs.append(i)
            }
        }
        let idx = Int(arc4random_uniform(UInt32(potential_idxs.count)))
        print(potential_idxs[idx])
        // For example arc4random_uniform(3) may return 0, 1 or 2 but not 3.
        return potential_idxs[idx]
    }
}

let test = Solution.init([1,2,3,3,3])
test.pick(3)

/**
arc4random_uniform(3) may return 0, 1 or 2 but not 3.

Int, UInt diff:
int: –2147483648 to 2147483647 
uint: 0 to 4294967295
*/