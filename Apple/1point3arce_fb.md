xuepanchen 
2017-8-4

[2017/08/03] Facebook电面面经
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=288511&fromuid=61227
(出处: 一亩三分地论坛)

朋友的内推，约得今天的电面。面试官是个国人小哥，人挺好的。
-google 1point3acres
1. 介绍现在职位做的事，还有Why Facebook。
1. Flatten Binary Tree To Linked List变形。和LC原题不同的是，返回的是Doubled Linked List，并且顺序是树的Inordered Traversal。
2. 给一个质数数组，没有重复元素，比如[2, 3, 5]，要求返回所有元素之间可能的乘积，比如结果是[2, 3, 5, 6, 10, 15, 30]，每个数最多用一次，结果不一定需要是有序的。
. visit 1point3acres.com for more.
每道题写完后都会让你手动过一遍test case，说一说每一步的结果，还问一下时间复杂度。第一题的复杂度是O(N)，N是树上的元素数目。第二题的复杂度我认为是O(2^N)，N是所给数组的长度。因为每个元素都有两种选择，包括或者不包括。

第二题做得一般，一开始写了个DFS算法，在手动跑test case的时候发现会产生重复，立马重写了一个DP的，写的时候还有个小bug也是在跑test case的时候改正了。希望小哥高抬贵手别太计较哈哈。


------------------------------

hello2pig
2016-10-26

上周facebook onsite 五轮
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=207610&fromuid=61227
(出处: 一亩三分地论坛)

面的mobile职位，不知道怎么搞出了五轮。已跪无疑。发个面经帮助有需要的人。

1. Coding. 从stream移动平均值。问了一些简历的内容已经mobile相关的乱七八糟（这里挂在了一个热身题上。。）。
2. Behavior. 都是地里的问题。然后一道电话键盘的组合问题。. 涓€浜�-涓夊垎-鍦帮紝鐙鍙戝竷
3.Architecture。 类似design instagram。
4. Coding。 Valid BST Tree。subarray sum ＝ k。又是一堆mobile相关。
5.Architecture。 design gmail。

所有coding题都很简单，不痛不痒的也不知道怎么突出表现。设计题都是一些主流做法也没什么值得提的。结果还搞砸了一道mobile相关的基础。


