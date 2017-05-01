// Decide the Last Byte's Encoding Type, similar UTF-8 Validation
/**
Given a byte array, which is an encoding of characters. Here is the rule:
    a. If the first bit of a byte is 0, that byte stands for a one-byte
character
    b. If the first bit of a byte is 1, that byte and its following byte
together stand for a two-byte character
Now implement a function to decide if the last character is a one-byte
character or a two-byte character
Constraint: You must scan the byte array from the end to the start.
Otherwise it will be very trivial.

一种encoding的方法，
如果一个byte第一个bit是0，比如 00000000，那它自己表示一个字符，
如果一个byte第一个bit是1，比如 10000000，那它和它后面紧跟的byte表示一个字符，
现在给一个byte array，判断最后一个字符是一个byte还是两个byte组成。
*/

// Solution: C++
//assume the answer is either one byte character or two-byte character
bool isBegin1(char *p){
    char a = 1;
    a = a<<7;
    return (*p&a);
}

bool isOneByte(char *start,  char *end){
    int len = end-start+1;
    vector<bool> dp(end-start+1);
    if(isBegin1(end))   return false;
    dp[len-1] = true;
    int i = len-2;
    for(char *p = end-1; p>=start, i >= 0; p--, i--){
        bool flag = isBegin1(p);
        if(flag && i+2 <len){
            dp[i] = dp[i+2];
        }
        if(!flag){
            dp[i] = dp[i+1];
        }
    }
    if(dp[0])   return true;
    else return false;
}

//
/**
solution: if the first bit of last byte is 1, return two byte char.
Otherwise, scan from the end until a byte whose first bit is 0, and count the
number of byte whose first bit is 1.
If the number is even, return one byte char, otherwise return two byte char.
O(n) time, O(1)space

https://github.com/checkcheckzz/coding-questions/blob/master/problem/String/Onetwobyteencoding.cpp
*/

//firstBit is a function, I omit the implementation.

bool isOneByte(string str) {

    bool res;
    int len = str.size();
    if (firstBit(str[len - 1]) == 1) {
        res = false;
    }
    for (i = len - 2; i >= 0 && firstBit(str[i]) == 1; i--) {


         if ((len - i) % 2 == 0) {


            res = "two-byte char"; true;


         } else {


           res = "two-byte char";

         }
    }

    return res;
}
