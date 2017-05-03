iOS

http://www.1point3acres.com/bbs/thread-203983-1-1.html
http://www.chengxuyuan.com/
https://algorithm.yuanbin.me/zh-hans/
http://333books.com/

------------------------ 1 -----------------------------------

http://www.mitbbs.com/clubarticle_t/New_Mommy_and_New_Daddy/20344137.html
Wed Mar 12 04:19:10 2014

看了本版很多面经，获益良多，所以我也把我近期面试的过程写下来，并且给出一些我
对系统设计题的想法，希望对正在找工作的人会有一点帮助。我的背景非cs非ee，不过
和编程相关，而且平时自己也经常写写程序。cc150和leetcode各刷了两遍。这次只申
请了F和G，最后F悲剧，G offer。

由于我有一些iOS的经验，所以申请F时申请的是iOS developer的职位。
F电面只有一轮：
先问了一些近期做的项目，然后编程是实现UIControl里的几个method，比如addTarget
什么的。不难。电面过后一周就安排了onsite。

F onsite 有4轮，全是白人：
1. 问了一些behavior的问题，比如简历里写的项目什么的，然后还问了最喜欢
facebook app的哪个功能，有什么可以改进的地方，怎么改进。还有为什么想去
Facebook。这些问题我基本都已经准备过，所以应该都答得不错。最后给了一个简单的
coding题，就是逆序打印链表里的值。我说了三个方法，一个是递归，一个是用stack
（和递归也差不多），还有就是先反转链表，按顺序打印，然后再反转一次恢复原状。
面试官好像很满意，让我选一个方法写code。我说前两个方法都很容易写，所以我就选
第三个方法。总体感觉这轮面得不错。

2. 这轮开始的时间完了5分钟，所以只面了40分钟，要求设计facebook iOS app的news
feed，不需要考虑服务器端的情况，只需要说app端的实现方法。这个我之前稍微准备
了一些，可是从来没有面过系统设计题，实在不知道应该怎么说，而且不知道会被问得
多深入，所以基本上一直是很被动的跟着面试官的指示走。画了几个框框以后就开始被
问各种细节，比如从服务器读数据的格式是什么，写一下json的example，界面和后台
怎么传输数据，等等。总体感觉这轮答得不好。回去后想了一下，感觉回答的方式有些
问题。比如说实现一个功能有两种方法A和B，他问我用哪种方法，我就直接说我倾向于
用A。这种答法很不好。应该先说清楚A和B各有什么优缺点，然后我选A是因为什么。这
样的话就会让人感觉我对于A和B都了解的比较多。

然后中午吃午饭，我跟recruiter说了第一轮不错，第二轮的设计不好。他说没关系，
只要下午的两轮都答好了就没问题。不过现在看来，设计题还是非常重要的，因为问设
计题的一般都是比较senior的人，所以估计他们的意见比较重要。（这只是我的想法。）

3. 又问了一些最近的项目的问题。这些都是warm－up questions，所以都只需简短的
回答。然后出了一个编程题：有两个一样的树A和B，每个节点都有父指针，要求写一个
函数，参数是A的一个子节点x，和B的根节点，要求返回B中对应x的那个节点。也就是
说A的根节点未知。这题挺简单，所以我没怎么想就说了先找到A的根节点，然后同时对
A和B做一个DFS或者BFS来找出B中对应x的节点。面试官说可以，让我写代码，写完以后
分析了一下复杂度。然后就问有没有更好的方法，我马上就意识到不需要用DFS或者BFS
，只需要在找A的根节点时记录下当前路径就行了（只需记录每个子结点是父节点的第
几个孩子），然后按同样的路径扫一下B树。复杂度只有O（height），面试官好像还很
满意。这轮面试没有一下就想到最优解，所以我还比较担心会不会结果negative。

4. 上来又是先问了一些项目的问题，然后拿出电脑来让我看一段程序，找出里面的不
合理或者有错误的地方。我说了10分钟，每说一个错误他都记下来，最后他说可以了，
已经写满一页了。然后出了一个编程题，要求用trie tree进行字符串匹配，字符串里
有可能有‘？’，代表任意一个字符，trie的结构是面试官给的，也不需要构造tree，
只需要使用就行了，所以还是比较简单的。写的时候有一个小错误，在测试时候发现了
就改正了。总体感觉还不错，应该比第3轮答得好一些。

面试完了以后recruiter来接我，说第3轮的面试官已经提交feedback了（效率真高），
是比较正面的。所以我觉得第1，3，4轮都应该能拿到正面的评价，因为第1和4轮都答
的比第3轮好，第2轮比较悬。之前我了解到有人的feedbacks是两个正面两个负面，最
后加面一轮了以后拿到offer，所以我还比较乐观，觉得最多准备一下加面一轮系统设
计。

面试完了以后就是圣诞假期，所以一直没有消息，到了一月份写信问recruiter，他说
今天和hiring team见了面，他们说不move forward了。。。我感觉可能是那个系统设
计拿到比较负面的评价。还是面试经验不足，不知道怎么回答这样的题。

－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
－－－－－－
G是general hire，电面也是一轮，以前发过面经，特别简单，编程题是leetcode的原
题。

面完第二天就被告知准备onsite，然后就是圣诞假期。。。一月份收到F的据信以后没
多久，G的onsite才定下了时间。

G的onsite有5轮，没有遇到leetcode原题，题目就不发了，毕竟签了NDA，我就说一下
过程吧：
1. 面试官是同胞。题目不难，是有关树的（和leetcode中等难度差不多）。这轮感觉
答的不太好，确认题意用了不少时间，然后写code的时候有一些小的错误被指出了以后
改正了，写的也比较慢。写完以后让我说一下可能会有哪些corner case可以用来测试
，这个我好像说的还不错，面试官还比较满意。

2. 第二轮面试官又是同胞，真是幸运啊。题目是有关概率的，出了3道题。最难的那题
不怎么会做，是在各种提示下慢慢做出来的。非常感激同胞的帮助。

3. 面试官是白人，出了一题不太难，可是很麻烦，就像leetcode里的valid number那
样有很多corner case。所以我一开始先把最重要的test case写一遍，没有马上写代码
。写test case时面试官也一起帮着想了一些。这个上面花的时间有点多，面试官说现
在还剩下20分钟了，我觉得你可以开始写代码了。于是开始狂写。写完后发现有个条件
没判断，又用箭头加了几个地方，然后面试官说你这个test case好像没考虑到，我一
看确实是忘了，写test case时写了，然后写代码时忘了，于是再改了一下代码。最后
面试官说代码还行。我问他是不是有什么fancy的解法，他说：没有，你的代码还行，
我看过更差的。。。然后他再稍微看了看白板，说其实你写的挺好的。。。

4. 第四轮有点非典型，面试官是白人，一上来就说他今天脑子不是很清楚，然后想了
半分钟题目。。。。然后出了一题我从没见过的，除了暴力法不知怎么做。面试官说：
我不在乎代码，你主要说思路，然后写pseudo code就行了。我说了下最简单的暴力法
，他说很好，你先把代码写出来。我说应该还有更好的方法，他说你先别急，把简单的
写出来再说。于是我把代码简单写了一下，也就十几行，复杂度是n^6。然后他开始想
下一步怎么办（这时我都插不上话。。。），然后说是不是可以用一个数组保存一些数
值，然后把其中的两层循环去掉，我说是的（这也是我本来想说的），于是改了一下代
码，成了n^4。下面怎么优化就比较难想了，我在想（当然，想的时候也在不停的交流
），他也在一直想，不知是不是在想怎么提示我。我实在想不出怎么优化，感觉dp什么
的都没法用。因为题目是一个两维的问题，我索性先把它简化成一维的，他夸我这个简
化做的好，这样就比较容易解释了。于是在他再次提示下我想到了用sliding window的
方法，确实可以解。他说很好，我们没时间来证明这个方法了，不过你现在把复杂度降
到了n^3，我说是的（没有再写代码），好像没法再优化了吧，他说这应该是最优了。
然后他说我们开始的时间晚了几分钟，所以现在没时间继续讨论了，他会把这个也写进
报告里。回来以后我又想了一下，还是不知道怎么把一维扩展到二维。。。这轮实在感
觉很乱。

5. 最后一轮是系统设计题，白人面试官。给了题目以后我就问了一些问题，其中有一
个就是这个系统会有多少用户，需不需要考虑large scale。他说这个问题很好，平时
一般都是应聘者回答到一定程度以后他主动问他们，让他们开始考虑large scale的。
我说我也会从单机开始说，因为比较好解释，他说这很好。于是我先画了几个框，把
components分一下，然后具体讨论一下。说了20分钟以后面试官说：不错，现在我觉得
是时间开始讨论large scale的问题了，于是我就开始画master － slave等一些图。这
次面试吸取了教训，每说到一个问题的解决办法，我都不直接说怎么解决，而是说有哪
几个方法，每个方法的优缺点是什么，选这种方法的话会遇到什么问题，我觉得哪种方
法比较合适，等等。然后有时会问他有没有什么preference，他也会说他更倾向哪种方
法。整个过程都比较顺利，我每说到一个点，他都会记录下来，所以我就更有信心了。
最后我还说了一下前一天看的consistent hashing，还画图解释了一下。

面完觉得算法题都面得很一般，只有设计题还不错，总体感觉比面F的时候差多了，所
以感觉基本悬了，希望比较渺茫。没想到过了一周recuiter说HC已经过了，有一个team
也很快对我有强烈的兴趣，再过了一周就送到VP那里了，然后过了几天就收到电话给了
offer。这次真是运气好啊，估计同胞给我的评价比较好，然后系统设计那轮也还不错
，另外两轮的评价也不是太负面，所以就给过了。当然都是我的猜测，不过真得谢谢同
胞们！

下面主要说一下我怎么准备系统设计题的吧。我对large scale system没有任何实战经
验，G的onsite之前专门花了两天时间准备系统设计题。最主要的是把cc150的
scalability的那一章非常仔细的看一遍，不只是记住最好的方法，而是把每个方法都
记住，特别是那章最后那个关于cache的题，虽然碰到的题不是关于cache的，但是还是
可以换汤不换药的把方法套用上去。然后看了一下gfs，mapreduce，和big table的三
篇论文。由于时间不够，我只是仔细读了gfs，然后泛泛的看了一下mapreduce和big
table。虽然这些文章里的内容在面试时没有直接用到，但是有些思路还是相通的。然
后我把consistent hashing看了一下，感觉这是万金油，很多地方都能说。另外还看了
一下“秒杀99%系统设计题”的博文，最后在highscalability.com里随便找了两三篇文
章看了一下。其他的东西全都没时间看了，但是如果有时间的话肯定是看看比较好。

由于我只面了F和G，面试经验还是比较少的，所以说的东西不一定对，只希望对大家有
帮助。

------------------------- 2 -----------------------------------

http://www.jidongchen.com/post/2017-01-16-facebook-iosmian-shi-er-dian-hua-ji-zhu-mian-shi
电话技术面试

一般HR会跟你协商电话面试的时间，这里有个小技巧，尽可能多要点时间以便更好地准备。一开始HR跟我提的时间是下一周，我问最迟能可以在什么时候。因为那段时间刚好赶上感恩节国外有节假日，所以最终HR跟我约定的时间在大概一个月后。这样子我有大概一个月的时间去准备（其实是二十多天）。顺带提一下，这次面试是通过Skype Audio，几次电话面试都是没有开视频的。

面试覆盖的内容

FB的面试流程相当规范，在约好时间后HR马上发了相关的邮件给我。邮件里面除了提到一些面试时间以外还提供了详细的准备指导！邮件包含了这次面试将会考察到的内容，因为我是面试iOS工程师所以这次主要考察OC知识以及算法问题。这里我列出一些面试的内容要点:

这次电话面试的时间为45分钟，面试时你需要使用Coderpad（在线的共享编辑器）编写代码，你在写代码的时候面试官可以实时地进行review。没有自动补全，不允许在线查询。
面试官会深入考察你对iOS平台以及Objective C的知识。
可能涉及到常见的技术问题，算法，数据结构，设计模式，时间复杂度分析，iOS API。
也有可能会问到常见的iOS业务逻辑实现，比如网络数据加载，UIKit。
要求是写出clean，可编译，高效的代码。
电话面试的几点技巧

具备良好的计算机知识基础，并且拥有一定开发经验的iOS工程师解决面试问题应该是没有太大问题的。沟通和交流成了我们这种国内工程师面试FB的主要问题。我相信FB在面试过程当中除了考察你的知识和编程能力以外更加看重的是你解决问题的方法和思维方式。所以在面试过程当中应该竟可能多地表达自己的想法，积极地去和面试官沟通，这里我是从HR那里获取的一些tips结合自己的经历分享几点:

收到题目以后，不应该急着写代码。首先应该仔细思考问题的各种限制条件并且积极去跟面试官确认各种细节和边界条件。比如，问题的规模，输入的格式，输出的格式，结果是否需要排序，有没有重复输入等等。如果你实在想不到此类问题，念一遍题目也是好的。
写代码之前一定要先把思路说给面试官听，一般思路没有问题面试官会示意继续写代码。如果有问题，面试官会给你提醒，你就需要再思考一下了。
对于iOS开发，我特别提醒一下，需要对内存管理有比较透彻的理解。现在大家都用arc，但是还是要理解内存管理的原理。
写出能运行的程序是首要任务，你可能没有想到最优解，但是尽可能写出可以运行解决问题的程序（尽管可能效率有问题）。
面试准备

我在网上看了很多面经，大部分面试准备都是刷Leetcode，不得不说我真的在面试过程中遇到过leetcode的题目。我也是以leetcode为主来准备面试的，但是因为职位要求面试当天要求使用objective c写代码，这是我没有预料到的。我一直在leetcode上面写C++，不过对于每天都使用oc的职业开发来说这也不是什么大问题。另外推荐一本书""Cracking the coding interview"，这部书必看，里面很多经典的题目。

我在面试之前去网上找了一个Mock Interview服务，也就是模拟面试。说实话当时mock完以后我感觉很糟糕，题目没有做出来，交流也有问题（当时mock的考官的是国外工作的国人）。这也激发了我的斗志，需要特训来加强自己的薄弱点。Mock之前我是一天刷一道，Mock之后我决心把Leetcode上面easy，medium难度的题目都做完，短短二十天将近两百道题还是很有挑战的。

同时我在跟朋友交流后得知在国外留学的同学找工作时都是很刻苦准备的，他们至少都刷了一遍leetcode，有些甚至刷了很多遍。对比之下，我觉得我努力还远远不够。

对于刷Leetcode我有几个tips：

不要开IDE，不开debugger，直接在网页里面写。代码不出样例的时候多检查逻辑和思路。我基本都是在网页里面写好代码直接提交的，有时候会有一些编译错误，但是问题不大。你如果能够做到Web编辑器顺畅的编写代码，无疑能够加强你盲写代码的能力。
建议先按照专题来刷：Array，Tree，HashTable, LinkedList，dynamic prograimming，graph,基本知识都复习巩固以后再进入题海战术。我特别重视Tree这一部分，这一部分题我刷了两遍。因为Tree这种数据结构变化最多，而且应用很有技巧，最能体现一个程序员基础的知识水平。从具体情况来看，我的判断是没有问题的，整一个面试下来有一半题目都是跟Tree有关的。
遇到不会做题目不要死磕，很多算法都是建立的一定理论上面的，很可能是你这方面的知识薄弱。看答案没有什么问题，但是不要去背答案，背答案面试官是很容易看出来的。
孰能生巧，多练多总结才是硬道理。
面试当天

面试当天我早上七点多起床热身然后在电脑面前等，一个外国小哥八点准时在Skype上打来了电话。首先自己介绍，然后问了几个iOS开发的问题，记得其中一个是NSNotification的作用和用法。然后是两道题目，要求oc进行编码。

1，写一个方法判断两个NSRange是否相交。
2，有两个完全一个UIView Tree， TreeA， TreeB, 给出TreeA中的节点指针NodeA，找出TreeB中对应位置的Node。
题目是不难的。第一题注意一下空Range。第二题的TreeNode就是UIView,UIView有一个superView指针可以往回找出一个路径。第二题我一开始用递归，其实直接用循环就够了，面试官稍微问了一下，我解释了一下也没有什么大问题。题目做完以后，就是问问题时间，这个可以自由发挥。

结果

面试完以后自己感觉还不错，几天之后收到HR约聊邮件，但是没有说结果。我有点担心这是传说中的Call To Reject。又焦急等了几天，这次HR没有准时到来，在我们约好的时间范围的最后五分钟才来电话，然后一上来祝贺我。真是套路啊，难道是要给我一个惊喜？这次谈话只有简短的五分钟，HR跟我说后面就是onsite了，由另外一个HR负责，于是我又马上开始了onsite准备。

http://www.jidongchen.com/post/2017-01-19

现场面试

我参加的这系列Onsite面试一共有四场，我按照我面试的顺序来写：

1. Architecture / Design
2. Coding
3. Coding
4. Career & Culture

Coding的内容是算法题和编程题目。Architecture / Design则是设计一个简单的App。Career & Culture 主要是和一资历比较深的工程师聊天有可能是技术主管，可能会涉及到一些编程问题，但是我当天没有。
我的准备

Onsite的面试形式是在白板上面写代码。为此我买了一个白板来练习，题目还是以Leetcode上面的为主。主攻easy和medium题型，hard很少出现。另外我还准备了一部分Architecture / Design，由于网上面经大多数提到的设计都是后台的，导致我看了好多后台架构设计，实际上的面试内容却是App设计。这里有点坑，不过涨知识也是好的。

面试当天行程安排

FB对于面试出行的费用都是全部报销的。Onsite的时间确认以后FB会有专人帮你购买机票，定酒店。这里要注意一下，机票是通过国外途径购买的，这跟我们用身份证购买的机票不一样。所以要保证提供给FB名字拼音要和身份证保持一致，不然登机的时候可能会有麻烦。例如张三应该为San Zhang。

面试地点定在北京，我在前一天从深圳起飞。酒店虽然是定好的，但是入住的时候也遇到了一些状况。我建议把HR发来的重要出行说明都打印一份，在必要的时候可以给相关工作人员看。我入住酒店的时候，可能酒店一些工作人员不清楚这个流程，差点刷了我的卡。我在邮件里面翻出一份说明给工作人员看避免了误操作,差点刷了我几千块啊！FB毕竟有钱，面试都是下榻五星级酒店。

面试当天与内容

面试从下午两点开始到六点。

第一面Architecture / Design，面试官是一个美国小哥。先各自自我介绍，然后开始做App设计题。题目要求设计一个简单的类似Facebook News Feed的App。面试过程中需要你去思考App所有模块，自上而下进行设计，以线框图的形式在白板上面呈现。

第二面是Coding，其中一个题目是经典算法题目二叉树的Lowest Common Ancestor。第二个题目是双向链表和HashTable的应用。对于LCA我一开始想用一种递归的方法实现，写到一半写不下去了，之后重新写了一种更直接的方法。

第三面还是Coding，第一题经典题目Move zeros,把一个数组所有非零数移动到左边，零全部移动到右边，要求时间复杂度O(n)完成。第二题二叉树的copy和中序遍历。

第四面和技术主管聊天，聊一些问题例如：你遇到的最大挑战是什么；你最值得骄傲的成就是什么；你怎么解决和别人的冲突。这种问题就看自己自由发挥了。

结果补充

面试的题目都不难，面完以后自我感觉良好。大概一个星期以后得到结果，悲剧了，做了一段时间的美国梦也醒了。我仔细想了想，题目光做出来是不够的，还要快，正确，最优解。一句话，细节决定成败。不得不说，FB的工程师非常注重细节，疏忽大意是我的主要问题。我跟HR要了一些反馈，里面我看到了一些对我面试表现的评价。有一个问题我知道好几种解法其实复杂度都差不多，但是我硬是选择了一种自己不熟悉的递归解法，最终也没写出来硬是换了一种更直接，这里导致了Coding的悲剧。另外设计面试也有很多细节没有想到位，有一些问题也没有解释得足够清楚。说白了还是自己的经验不足，能力还需要提升。有志于出国的同学，我从这次经历给出两个建议：

平时写代码多注意设计，设计能力真是总结积累出来的，平时不注意很难有好的表现。
注重每一个细节，不要因为问题简单而掉以轻心。不怕问题难以解决。就怕简单的问题细节没做好导致大问题。
虽然结果让我失望，但是这次经历本身是美好的。我对自己不足有了深入的认识，也增长了自己的见识。以后如果还有类似的机会，我想我还是会尝试。感谢所有在这次面试准备过程中给我帮助的朋友！

-------------------- 3 -----------------------

https://www.glassdoor.com/Interview/Questions-Print-all-paths-in-a-binary-tree-Function-to-find-the-square-root-of-a-number-Pretty-print-JSON-object-QTN_834854.htm

 Questions
 - Print all paths in a binary tree
 - Function to   find the square root of a number
 - Pretty print JSON object
 - How would you design home feed?
 - Simple regex matcher

 -------------------- 4 ------------------------

 http://www.1point3acres.com/bbs/forum.php?mod=viewthread&tid=191077&fromguid=hot&extra=&mobile=2

 其他家面试的总结在另外一贴。 这里专门开一贴讲讲fb家的面试。
http://www.1point3acres.com/bbs/ ... D311%26sortid%3D311. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴

lz对fb的面试研究的最多，分享下经验。

FB家对new grad 或者毕业后工作短于一年的同学是可以不考design的。

对phd 毕业或者毕业超过一年的童鞋是要考desig
phone interview 只考coding。
onsite 经典4轮 Coding/"Ninja" (2)  Design/"Pirate" (1)  Conversation/Career Background & Trajectory/"Jedi" (1)
根据面试情况可能会加试一轮。

算法 & coding ： 个人感觉 leetcode 刷透做熟悉就够了。 fb 家不是以难度取胜。他家一般都是leetcode medium level的题目，一般是原题或者小变种。
他家coding的难点是bug free， 细节和追问。
比如说给你一个 binary tree， 每个节点存一个整数值，让你求每个layer的平均数。
这个题目看上去很简单， 但是要注意输出， 3和4 平均是3.5， 如何你用java 解，输出是整数，那么你的结果就不准确。
这些细节点一点要问清楚，如果考官让你自己定，那就选保险一些的。
. 涓€浜�-涓夊垎-鍦帮紝鐙鍙戝竷
另外就是bug free， 这里bug free指的是没有逻辑和算法错误，变量名啥的写错了也没啥。

另外coding 轮最重要的一点还是communication， 考官问完问题以后，一定要clearfy 一下题目的意思和输入输出。
然后把你的思路和考官说一下，之后考官同意，再写code。 他家很注重交流，如何你听完题目，就直接写code。
就算是最优解，你也会fail，因为没有交流的过程。 coding 轮不光考算法，也会看你的交流能力如何。

design： 他家的design 有难有易。  基本部分另外一帖子说过了直接贴过来。
能准备的准备好了，剩下的就是放宽心态，好好发挥了。实力到了，那么胜率自然高。
fb家大牛很多，design比较看运气。. 鍥磋鎴戜滑@1point 3 acres

design 轮是有技巧性的。
一般过程是
１ 问清 requirement ５～１０ 分钟
２ high level design（设计flow 相关api 和数据存储）
３ 细节设计，详谈flow， api

一定要按顺序来。不要直接跳到第三步。
下面几段话感觉很有用。lz是实战后得出的这些总结。
ab和fb都跪在design，之后调整策略，胜率就上升了。
.鏈枃鍘熷垱鑷�1point3acres璁哄潧
准备design主要是参考了这个网站：. 1point3acres.com/bbs
http://www.hiredintech.com/system-design/. 1point 3acres 璁哄潧
感觉还是挺有用的。其他就是mitbbs上那位大牛给的一些资源
http://www.mitbbs.com/article_t/JobHunting/32777529.html


Conversation/Career Background :
自己的工作经验和project要准备好，这个没啥好说的。
下面几个是常见的 behavious question：

1 First, ask some questions about Facebook, do you use Facebook?. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴
2 Why you like it?
3 Which part of it should be improved?
4 What challenge you face in your pre project and how you result it?
5 Why facebook
6 My current project and how I scale our applications.
7 包括以前的成就，怎么说服别人做design的修改，说服不通怎么办。
8 FB specifically (vs. other companies)



附录FB 常见design 问题=============================
1 Design a web crawler with fixed set of resources.
. visit 1point3acres.com for more.
2 Design a real-time type-ahead search-phrase predictor which presents the top-10 ranked search strings that begin with a given prefix.
3 Design timeline的group权限，比如说user发一条status可以选择对某个group的好
友可见。题目很简单，但是会讨论到facebook用户规模的估算，服务器估算，social  graph的存储。感觉system design只要讲个大概思路就行，面试官不会去纠结太细节的东西。
4 design偏向设计存储结构
5 system design: 设计key-value store，直接列了一大堆从client到server的要求，基本处处陷阱，经验这里比较重要，光按面试准备
基本没效果。. 涓€浜�-涓夊垎-鍦帮紝鐙鍙戝竷
6 搜索栏的自动完成功能
7 那个给你一个点， 然后有几个million的POI， 找出最近的20个。。。我说那个Z distance。。 two dimension变成一个dimension， 那个面试官说， 没听说过Zdistance， 不行。。。
8 find close coordinates
9 上来讨论了20分钟的如何设计data structure表示fb的friend和follower两种关系
，各种结构的tradeoff。我边讨论边猜是不是要我clone graph，然后默念怎么还不让
我写code。果然，deep copy。不过最后讨论的data structure 和lc上有点不同，dfs. Waral 鍗氬鏈夋洿澶氭枃绔�,
思路是一样的。整个过程很愉快，abc男也是好多positive feedback。面试结束了还和. visit 1point3acres.com for more.
我激动的说了半天来fb的种种好处（工资，休假之类的）
10 deadlock设计. 1point 3acres 璁哄潧
11 问为什么Facebook，对Facebook的哪个feature最喜欢，为什么喜欢，然后这个feature还有什么不足。
12 之后让给他一个非常specific的例子说当你和同事出现技术上的冲突的时候，应该怎么解决，问的特别细，.鏈枃鍘熷垱鑷�1point3acres璁哄潧
特别深入。
13 从头到尾面无表情，口音也很难懂，我当时就觉得不妙，
果真就跪在这轮。design news feed API, 这题我准备过，但是按pull/push model准
备的，还准备了pub/sub model，就是给每一个friend都建一个queue,推送一份news，
算准备过的题。但他不考这些，根本不让我说关于aggregator tier或者database tier
的东西，主要focus API怎么写，input/output, feed里图片怎么存，想mention
friends怎么存，怎么做multi device sync。我觉得他的考点似乎在data
serialization/deserialization这边？感觉和他交流就是隔着窗户喊话,一直在猜，所
以差评也是必然的。。。.鐣欏璁哄潧-涓€浜�-涓夊垎鍦�

14 设计题，传输10G的data到5个data center，每个data center 有1000的
节点。三哥从问背景就开始找茬，面试过程中要求解gossip protocol的微分方程， 被
黑。
15 设计iPhone Find Friends 的后端。Geohashing + DHT解之
16 设计题问得很细，比如DHT如何实现，单机的Hash table如何实现能节省内存， 如何做
concurrency control，如何实现mutex之类的。
17 system design: 每个record有个很大field，比如年龄，性别，爱好等。给一个field的组合，比如小于25岁，爱好体育，query满足这些组合条件的用户个数
18 设计一个facebook的搜索引擎，这个引擎能搜索出包含关键字的facebook动态。没有讨
论太多前端的，主要在讨论架构和存储。
给出了倒排索引来存储index，以及讨论了下如何存储facebook的动态(key-value 存储
）如何handle hot keyword。面试官人很好，引导我的思路。
19 system design白人大叔， 有个function是List<id> getNearest(int x, int y
){}, 假设从mobile上在地图上点一下，然后返回改点附近的所有建筑location。怎么
设计data structure以及data scheme
20 System design设计手机上读取photo feeds的app。
    功能： 读取好友的最近图片
               阅览好友的相册. 鐗涗汉浜戦泦,涓€浜╀笁鍒嗗湴
    要求： 满足功能的同时减少对手机的能耗。
21 design：tiny url。. 1point 3acres 璁哄潧
22 System design： instgram
23 Culture fit： 有200M个用户，现在让你进行分组，将他们分成大概20个组，每个. Waral 鍗氬鏈夋洿澶氭枃绔�,
组里大概有10M的用户，尽量让用户interaction多的在一起
24 design看了下几篇文章，知道个大意，google的mapreduce, file system, big table,
fb的memcache, unicorn。其他看到过的觉得还不错的design资料，最后一个常见题目
汇总可以过过看，很有帮助:
http://blog.csdn.net/v_july_v/article/details/7382693
https://www.youtube.com/watch?v=-W9F__D3oY4
http://www.mitbbs.com/article_t/JobHunting/32741713.html-google 1point3acres
另外建议稍微准备下常见数据类的写法(包括generic programming), 我倒是没碰到其
他一些concurrency, database, NP-hard之类的题目.
25 设计一个facebook功能：在一个post下面，如果有了新的comment，可以自动显示，-google 1point3acres
不需要刷新后再显示。
26 design facebook chat. from: 1point3acres.com/bbs
27 design facebook chat
28 写一个sequential 多线程pool。实现f（Runable r）要求caller不可以block，但是
在pool里面要一个跟这一个的运行。. from: 1point3acres.com/bbs
29 设计类似gogle地图系统，从A点到B点的算法已经有了。整个地图大概有好几亿条线
段组成，这个系统的市场占有大概30%。要求在小于1妙的时间里算出结果。估算需要多
少台机？要怎么样保存地图，怎么cache？
30 然后面试中有个印度人问了个问题，就是如果系统出问题了，有个size很大的log如何
从里面找出相关的信息，同学说直接search关键字，但是面试官不满意也没给提示，所
以不知道怎么回答。
31 国人面试官面出的 design：Shorten Url。面试官人非常nice，可是自己答的一般
，在此谢谢他。.鏈枃鍘熷垱鑷�1point3acres璁哄潧

32 google的mapreduce, file system, big table,
fb的memcache, unicorn。其他看到过的觉得还不错的design资料，最后一个常见题目
汇总可以过过看，很有帮助:
http://blog.csdn.net/v_july_v/article/details/7382693
https://www.youtube.com/watch?v=-W9F__D3oY4
http://www.mitbbs.com/article_t/JobHunting/32741713.html
另外建议稍微准备下常见数据类的写法(包括generic programming), 我倒是没碰到其
他一些concurrency, database, NP-hard之类的题目.
33 设计一个SparseVector （就是一个超长的vector，大部分elements都是0）的
class，实现dot product的操作。follow-up1:如果一个vector很长（millionsof non- 鏉ユ簮涓€浜�.涓夊垎鍦拌鍧�.
zeros）， 另一个vector很短（hundredsof  non-zeros），如何优化。follow-up2:如
何利用index之间的关系（比如设计class的时候规定按照递增的原则存non-
zeroelements的index）进一步优化。
34 ystem Design：设计一个K recent contact 的service，就是当用户把鼠标点到
chat对话框的时候，自动弹出K个最近的联系人。follow-up是如果要弹出K个最熟悉的. 鍥磋鎴戜滑@1point 3 acres
人怎么设计，以及资源估计（需要多少台机器来做数据存储，多少个处理request等等
）。
35 design准备：板上有几个design总结贴，非常管用。我就是照着 flamingos和beidapig-google 1point3acres
的两个总结贴，大概看了看，学习了不少知识。
http://www.mitbbs.com/article_t/JobHunting/32777529.html.鐣欏璁哄潧-涓€浜�-涓夊垎鍦�
http://www.mitbbs.com/article_t/JobHunting/32984309.html

. From 1point 3acres bbs

.鐣欏璁哄潧-涓€浜�-涓夊垎鍦�

补充内容 (2016-5-20 02:51):
面试经验谈（facebook，airbnb，google，linkedin，Amazon
http://www.1point3acres.com/bbs/ ... D311%26sortid%3D311

FB 面经 phone & onsite  攻略 附录题库呦
http://www.1point3acres.com/bbs/thread-1910.... 1point 3acres 璁哄潧
http://www.1point3acres.com/bbs/thread-191081-1-1.html
.鏈枃鍘熷垱鑷�1point3acres璁哄潧
补充内容 (2016-5-20 02:52):
airbnb 面经 phone interview & onsite 附录题库呦  http://www.1point3acres.com/bbs/ ... D311%26sortid%3D311

补充内容 (2016-5-20 02:52):
lz的刷题攻略。。 http://www.1point3acres.com/bbs/ ... D311%26sortid%3D311
. from: 1point3acres.com/bbs
补充内容 (2016-5-20 02:53):-google 1point3acres
补充的几个帖子里 有高频的机经（design & 算法）
