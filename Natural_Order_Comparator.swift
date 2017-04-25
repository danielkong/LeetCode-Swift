// Natural Order Comparator
/**
http://www.1point3acres.com/bbs/thread-179527-1-1.html
一个笑呵呵的三哥，出了道题：自然string comparator。不知道的搜下。就是string 比较的时候考虑里面数字的大小，比如 abc9 < abc123 abc > ab9  因为char比digit重要。写的很顺利，最后run了test case 人家也说没问题。 然后就结束了。结果下了我自己ide跑发现有case 没cover，不知道他怎么想的，求过！求bless。

要的就是这样：. 鐣欏鐢宠璁哄潧-涓€浜╀笁鍒嗗湴
static class NaturalComparator implements Comparator<String> {
    /**
     * return negative num if l < r
     0  if l == r
     positive if l > r
     */
    public int compare(String l, String r) {}

*/
