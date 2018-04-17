// Permutations Print
/**
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=145285
Permutations Print
*/
/**
https://leetcode.com/problems/permutations/#/description

 Given a collection of distinct integers, return all possible permutations.
 
 Example:
 
 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 */

// Solution: Runtime: O(n!), Space O(n)
// array contains also use O(N)
// So this solution O(N * N!)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count != 0 else {
            return []
        }
        var res = [[Int]]()
        var item: [Int] = []
        helper(nums, &item, &res)
        return res
    }

    private func helper(_ nums: [Int], _ item: inout [Int], _ res: inout [[Int]]) {
        if item.count == nums.count {
            res.append(item)
        } else {
            for num in nums {
                if item.contains(num) { continue }
                item.append(num)
                helper(nums, &item, &res)
                item.removeLast()
            }
        }
    }
}
// Solution: Runtime: O(n!), Space O(n)
//  since array contains func needs O(N), here we use set to find contains O(1)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        helper(&res, &temp, nums)
        return res
    }
    
    func helper(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int]) {
        if temp.count == nums.count {
            res.append(temp)
            return
        }
        var set = Set<Int>()
        for item in temp {
            set.insert(item)
        }
        for i in 0..<nums.count {
            if set.contains(nums[i]) { continue }
            temp.append(nums[i])
            helper(&res, &temp, nums)
            temp.removeLast()
        }
    }
}
// Solution Java:

public List<List<Integer>> permute(int[] nums) {
   List<List<Integer>> list = new ArrayList<>();
   // Arrays.sort(nums); // not necessary
   backtrack(list, new ArrayList<>(), nums);
   return list;
}

private void backtrack(List<List<Integer>> list, List<Integer> tempList, int [] nums){
   if(tempList.size() == nums.length){
      list.add(new ArrayList<>(tempList));
   } else{
      for(int i = 0; i < nums.length; i++){
         if(tempList.contains(nums[i])) continue; // element already exists, skip
         tempList.add(nums[i]);
         backtrack(list, tempList, nums);
         tempList.remove(tempList.size() - 1);
      }
   }
}
