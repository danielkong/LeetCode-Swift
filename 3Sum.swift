// 3Sum
/**
Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note: The solution set must not contain duplicate triplets.

For example, given array S = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
*/

// Solution: Swift
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        guard nums.count > 2 else {
            return res
        }

        var nums = nums.sorted()

        for i in 0..<nums.count-2 {
            if i == 0 || (i>0 && nums[i] != nums[i-1]) {
                let sum = 0 - nums[i]
                var low = i + 1
                var high = nums.count - 1
                while low < high {
                    if nums[low] + nums[high] == sum {
                        res.append([nums[i], nums[low], nums[high]])
                        while low < high && nums[low] == nums[low+1] { low += 1 }
                        while low < high && nums[high] == nums[high-1] { high -= 1 }
                        low += 1
                        high -= 1
                    } else if nums[low] + nums[high] > sum {
                        high -= 1
                    } else {
                        low += 1
                    }
                }
            }
        }
        return res
    }

// Solution Java
    // public List<List<Integer>> threeSum(int[] num) {
    //     Arrays.sort(num);
    //     List<List<Integer>> res = new LinkedList<>();
    //     for (int i = 0; i < num.length-2; i++) {
    //         if (i == 0 || (i > 0 && num[i] != num[i-1])) {
    //             int lo = i+1, hi = num.length-1, sum = 0 - num[i];
    //             while (lo < hi) {
    //                 if (num[lo] + num[hi] == sum) {
    //                     res.add(Arrays.asList(num[i], num[lo], num[hi]));
    //                     while (lo < hi && num[lo] == num[lo+1]) lo++;
    //                     while (lo < hi && num[hi] == num[hi-1]) hi--;
    //                     lo++; hi--;
    //                 } else if (num[lo] + num[hi] < sum) lo++;
    //                 else hi--;
    //            }
    //         }
    //     }
    //     return res;
    // }

// Solution Swift 10.14
        func threeSum(_ nums: [Int]) -> [[Int]] {
            var nums = nums.sorted()
            guard nums.count > 2 else { return [] }
            var res = [[Int]]()

            for i in 0 ..< nums.count - 2 {
                if i == 0 || (i > 0 && nums[i] != nums[i-1]) {
                    let a = nums[i]
                    var idx2 = i+1
                    var idx3 = nums.count-1
                    while idx2 < idx3 {
                        let b = nums[idx2]
                        let c = nums[idx3]
                        if b + c == -a {
                            res.append([a, b, c])
                            while (idx2 < idx3 && nums[idx2] == nums[idx2+1]) { idx2 += 1 }
                            while (idx2 < idx3 && nums[idx3] == nums[idx3-1]) { idx3 -= 1 }
                            idx2 += 1
                            idx3 -= 1
                        } else if b + c < -a {
                            idx2 += 1
                        } else {
                            idx3 -= 1
                        }
                    }
                }
            }
            return res
        }
    }
