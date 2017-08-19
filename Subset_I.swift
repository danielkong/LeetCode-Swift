// Power set Subset I
/**
https://instant.1point3acres.com/thread/204422
做了一题powerset，给了个iterative的解法，又有点小bug（不得不说面试真的很容易紧张犯错弄出平时刷题不会出的错）。
稍微debug了一下，面试官又犹豫要不要继续出题了。。
我让他继续，就follow up了powerset iterator，时间不够了给了思路，
然后follow up big o。

Power Set Power set P(S) of a set S is the set of all subsets of S.
For example S = {a, b, c}
then P(s) = {{}, {a}, {b}, {c}, {a,b}, {a, c}, {b, c}, {a, b, c}}.
If S has n elements in it then P(s) will have 2^n elements
Time Complexity: O(n2^n)

http://www.weiming.info/zhuti/JobHunting/32973055/
*/
