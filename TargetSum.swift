// 494. Target Sum - Medium
/**
You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

Find out how many ways to assign symbols to make sum of integers equal to target S.

Example 1:
Input: nums is [1, 1, 1, 1, 1], S is 3. 
Output: 5
Explanation: 

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3

There are 5 ways to assign symbols to make the sum of nums be target 3.
Note:
The length of the given array is positive and will not exceed 20.
The sum of elements in the given array will not exceed 1000.
Your output answer is guaranteed to be fitted in a 32-bit integer.
*/
/**
	Solution 1: DFS (Brute force)
		Runtime: O(2^n)
		Space: O(n)
	Solution 2: Dynamic Programming 1-D array
		Runtime: O(N*M) M means nums array traverse how many times (constant number)
		Space: O(N)
*/

    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        
        var count = 0
        var sum = 0
        
        for num in nums{
            sum += num
        }
        
        var currentNums = Array(repeating: 0, count: sum * 2 + 1)
        
        currentNums[-nums[0] + sum] = 1
        currentNums[nums[0] + sum] += 1
        //var currentNums = [0 - nums[0], nums[0]]
        
        var index = 1
        
        while index < nums.count{
            
            var newNums = Array(repeating: 0, count: sum * 2 + 1)
            
            let currentNumber = nums[index]
            //let actualNumber = currentNumber + sum
            
            for number in 0...currentNums.count - 1{
                if currentNums[number] > 0{
                    newNums[currentNumber + number] += currentNums[number]
                    newNums[-currentNumber + number] += currentNums[number]
                    
                }
                //let positive = currentNumber + currentNum
                //let negative = 0 - currentNumber + currentNum
                
                //newNums.append(positive)
                //newNums.append(negative)
            }
            currentNums = newNums
            
            index += 1
        }
        
        // for num in currentNums{
        //     if num == S{
        //         count += 1
        //     }
        // }
        
        return S > sum ? 0 : currentNums[S + sum]
        
    }
