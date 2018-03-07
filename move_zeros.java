class Solution {
    public void moveZeroes(int[] nums) {
        int idx = 0;
        int nonzeroIdx = 0;
        while (idx != nums.length) {
            if (nums[idx] != 0) {
                nums[nonzeroIdx] = nums[idx];
                nonzeroIdx += 1;
            }
            idx += 1;
        }
        
        for (int i=nonzeroIdx; i<nums.length; i++) {
            nums[i] = 0;
        }
    }
}
