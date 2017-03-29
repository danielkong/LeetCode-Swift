

1：有一堆朋友和朋友关系，把他们分总成两个group，group内互不认识, bipartile graph
2：Jump game II

http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=268942

楼主总共5轮，一轮behavior，两轮coding，两轮system design。
. more info on 1point3acres.com
第一轮：Behavior + coding
面试官是个国人大叔，问了我为什么选FB，因为楼主在Google刚工作了6个月，所以也问了为什么要离开Google。这一轮感觉说了太多负面的话，可能给了面试官我是个负能量爆棚的人的印象，所以感觉不太好。
最后剩十分钟，大叔问了道coding的题。很简单：是否是回文，LC125，easy的题，楼主过于得意忘形，结果忘了考虑lowercase和uppercase。。。

第二轮：System Design
面试官是个美国大哥，感觉人很nice。问题是design type ahead system，面试官全程很responsive，楼主说一部分，面试官提出一部分问题，然后楼主继续答。反正自我感觉良好。

. from: 1point3acres.com/bbs 
然后是Lunch Break，跟给楼主内推的人一起吃饭，吹吹牛逼扯扯皮就过去了。
. 1point 3acres 璁哄潧
第三轮：Coding (With Shadow) 鏉ユ簮涓€浜�.涓夊垎鍦拌鍧�. 
面试官是个白人，听口音像东欧来的。问题是，有一个wall，然后宽度和长度都固定。这个wall呢，用一个vector<vector<int>> wall表示，每一行代表一行砖，每块砖的宽度不固定。然后wall[j]代表砖的宽度。
然后在墙上画线的话会cross这些砖，问你怎么画线可以cross的砖数最少(如果画的线正好在砖的一条边上不算cross)，返回这个最少的砖数就行，还问了时间和空间复杂度。
follow up是这面墙的高度很小，但是宽度很大，每一行可能有特别特别多的砖，问你怎么办。. 鍥磋鎴戜滑@1point 3 acres

. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴
第四轮：Coding
面试官是个很腼腆的小哥，问了那道k closest points to (0,0)，楼主用了priority queue，问了时间和空间复杂度。然后小哥继续问能不能把时间复杂度继续降低，思路跟LC215一样。小哥说不用写了，继续下一题。
下一题就是LC117，唯一不一样的是，每一个level的最后一个node的next要指向下一层的第一个node。

第五轮：System Design (With Shadow)
面试官是个不知道哪个国家的大叔，口音既像日本的又像东南亚的。。。问的题之前在面经里看过，是给你10K个机器，然后1B的url，机器之间不能通信，问你怎么样每个机器才能平均的分任务。虽然看过，但是没准备过，答的很不好，基本上大叔提示一下才能答出来一点儿，最后基本相当于大叔给出了答案。
这题之后还问，之前那题是在hacker的角度思考，如果现在让你站在网站维护人员的角度，你该怎么防止有人crawl你的网站，不停的给你发request。答用rate limiter，大叔继续问还能用什么方法，怎么区分是machine还是人发过来的request。反正最后感觉他要问的是怎样防止服务器的load过重。这一轮跪的很彻底，稀碎。。。
. 1point3acres.com/bbs
感觉第一轮和最后一轮都是折的节奏，反正面完就不管了，坐等结果，有结果了再来update。

.1point3acres缃�


补充内容 (2017-3-24 15:00):
第三轮那道题就是从上到下画一条直线，其实就是要找到最多的砖块的边是上下连通在一起的，沿着这样的边画线不算cross砖块。. visit 1point3acres.com for more.
.鏈枃鍘熷垱鑷�1point3acres璁哄潧
补充内容 (2017-3-24 15:05): 鏉ユ簮涓€浜�.涓夊垎鍦拌鍧�. 
第五轮的1B URL是只有一个starting point，需要traverse才能拿到所有的1B url

http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=270653
国人小哥, 放水严重上来问做过最屌的prject，楼主一不小心没有刹住车，被打断说你丫废话真多还想不想愉快地撸题了。。。小哥人真的太好了
1 Decode ways. 鐣欏鐢宠璁哄潧-涓€浜╀笁鍒嗗湴
2 判断subarray的和是否有目标值，只返回布尔值。有正有负。

http://www.hawstein.com/posts/binary-indexed-trees.html



http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=270446
上周二（mar 21）面的，至今没消息，目测挂了应该是华人 老哥，
第一题 decodeway  follow  abc 不map123了  map其他给定的数字， 比如 a->13 b->51 c->55, 问了范围说 说小于100
第二题 subarray sum = k  只要true false. visit 1point3acres.com for more.
第三题 clone list with rand ptr。
题都简单 但是交流不大流利，第三题 我用全局hashmap+递归写的，老哥一直问 1进来了  what next， 我没懂想让我讲啥 我就在解释算法啊，  其实是让我口头run一个text case吧。。

fb  这么好的机会，，，好可惜啊，，，求一丝电面二的机会。. more info on 1point3acres.com

求米 谢谢！



补充内容 (2017-3-28 13:55):
周一了 还是没消息，，，，
其他方面   resume上的proj一定要准备好  非常top to down的 非常briefly的introduce出来， 什么最大的challenge  failure conflict  直接熟练背诵万事。

http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=270140
店面我去menlo park campus面了，感觉面对面交流会好一点。第一题是merge intervals 变形，问一共可以覆盖的区间总和。第二题把一维intervals 拓展到2维，每个interval由起点和终点组成，问怎么merge。最后时间不够，就让写了一个comparator。

on site一共四轮
第一轮bh➕电话号码那道题
第二轮第一题是一个常见的面筋题，突然想不起来了，第二题是dot product那道和各种follow up. more info on 1point3acres.com
第三轮系统设计问的是给一个location，找出附近1mile以内所有的地点
第四轮regular expression matching

刚面FB onsite, 问了一道design题。privacy setting. 说是user可以发Post, 问如何设计friends可见后来follow up 问如何设计user朋友的朋友也可见，我说先找user的朋友，再找user朋友的朋友，他说这样就O(N^2)了，问有没有O(N)来设计friend of friend可见的方法？  不知道怎么答了。。
大家有什么好方法吗？.1poin

就问了一道问题，subset的string 版本...白人小哥，7年工龄...偷偷查了linkedin发现时斯坦福的...全程耐心无比...自我介绍完问了我简历毕设论文的问题...差点没答上来...0 0还好蒙混过关...之后coding. 还是用STD output...dfs实现问复杂度被考到了，然后在小哥的提示下...给出2^n...一开始我还以为是n^2之类的...然后我是存到一个list里面小哥叫我优化空间复杂度，就是找到一个输一个。然后问我dfs的call stack是多少，然后需要多少memory...一脸懵逼，以为是O(n)...然后他再提示我...每找到一个需要多少？然后就得到了O（n^2）。follow up就是duplicate的情况...然后我说排个序再加个判断就搞定了...小哥看我在排序那边有点卡壳...就说你可以当做是sorted的...加完判断让我写程序输出，感觉应该work，再问我Best case 和wrost case复杂度...这个就easy了。然后时间差不多到了，就问问题啦~

感觉自己一二面人品都爆了，问的全是easy和mid的题...然后小哥都是无比nice的，facebook还是女神公司...能入就好啦~不能入也不后悔，自己刷的题还是不够多...多多准备也挺好哒。. Waral 鍗氬鏈夋洿澶氭枃绔�,
大家加油！


补充内容 (2017-3-2 12:48):
题目就是利特抠德玖拾的string版把数字变成string
. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴
补充内容 (2017-3-3 06:44):
今天下午收到拒信~估计就是复杂度不熟悉所以悲剧啦~嗯嗯，还要多多温习基础知识。看看三月份还有什么实习或者准备好好刷题就是了

