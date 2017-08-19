// Point in Intervals
/**
http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=205979

第二个国人大哥, 给你一个interval : start, end.  给你一个point x, 问这个point在不在interval之间.
然后问如果有一群 interval,返回点是否在其中一个interval之内.. 那就每一个每一个比对.
最后说我要query 100万次,你要怎么搞.
我说把interval merge一次,然后二分查找. 并且设cache记录已经查询过的点. 
*/
/**
http://community.bittiger.io/topic/636/facebook%E9%9D%A2%E7%BB%8F%E6%B1%87%E6%80%BB-%E4%B8%8B%E7%AF%87

列表还有一道没见过：是interval的题
公司里有好多employee，给出入职和离职的时间段，打印出每个时间段的在职人数
输入：
［1, 2005, 2016］. 1point 3acres
［2, 2008, 2014］
［3, 2006, 2008］.
［4, 2010, 2014］. From 1point 3acres bbs
输出:
2005-2006: 1. 1point3acres.com/bbs
2006-2008: 2
2008-2010: 2
2010-2014: 3
2014-2016: 1
也是白人小哥，人很nice，第二题各种提醒我。最后我把所有时间排序，不管是入职还是离职时间.
*/
