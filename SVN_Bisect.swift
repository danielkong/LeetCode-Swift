// SVN Bisect
/**
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=96115
第二题：（以Git bisect 为背景的题目， 他给解释了一下bisect是干什么的，没有听懂，不影响做题）题目抽象出来就是一个布尔型的数组，
从某一项开始就全变成False了，找出第一个False的index。
已知第一项一定为真，最后一项一定为假。.

*/

// Solution: Python

def is_good(rev):
  return rev < 174

def bisect(good, bad):. 1point 3acres 璁哄潧
  left = good. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴
  right = bad
  while left <= right:
    mid = left + (right - left) / 2. Waral 鍗氬鏈夋洿澶氭枃绔�,
    if mid > 0 and is_good(mid - 1) and not is_good(mid):
      return mid.鏈枃鍘熷垱鑷�1point3acres璁哄潧
    elif is_good(mid):
      left = mid + 1
    else:
      # not is_good(mid):
      right = mid - 1. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴

res = bisect(86,594) #works :)
