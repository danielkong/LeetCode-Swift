// Permutations Print
/**
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=145285
Permutations Print
*/
/**
https://leetcode.com/problems/permutations/#/description
Given a collection of distinct numbers, return all possible permutations.
*/

// Solution: Runtime: O(n^2), Space O(n)
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
