// Monotonic Array
/**
https://www.glassdoor.com/Interview/Write-a-program-to-check-whether-the-array-is-monotonic-QTN_1560926.htm
Write a program to check whether the array is monotonic
*/

/**
http://www.1point3acres.com/bbs/thread-203813-1-1.html
1. 判断数组是否是单调

注意可能是单增也可能是单减。

先用了 ([i]-[i+1])*([i+2]-[i+1])<0判断，但是面试官说可能有重复， 比如 【5,6,8,8,7】
所以老老实实从左开始扫描，定一个flag，如果小了就flag设成-1，并且设之前先看flag是否等于1，如果是就说明不单调。 flag初始为0
*/
