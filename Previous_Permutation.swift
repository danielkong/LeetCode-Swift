Previous Permutation
/**
previous permutation. 这个看看c++的algorithm库有实现.自己写一个也不难.  建议连同next permutation一起看了.
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=205979
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=214221

Given a list of integers, which denote a permutation.

Find the previous permutation in ascending order.
https://lefttree.gitbooks.io/leetcode/CombinationandPermutation/previousPermutation.html
*/

class Solution:
    # @param num :  a list of integer
    # @return : a list of integer
    def previousPermuation(self, num):
        # write your code here
        if not num:
            return None
        length = len(num)
        i = length - 2
        while i >= 0:
            if num[i] > num[i+1]:
                break
            i -= 1
        #already smallest
        if i == -1:
            num.reverse()
            return num
        for j in range(i+1, length):
            if j == length - 1:
                break
            if num[j] < num[i] and num[i] <= num[j+1]:
                break
        tmp = num[i]
        num[i] = num[j]
        num[j] = tmp
        num[i+1:length] = num[length-1:i:-1]

        return num
