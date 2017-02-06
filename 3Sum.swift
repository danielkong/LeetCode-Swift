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
