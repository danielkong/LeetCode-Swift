//Product of Primes
/**
products of prime 用 bit manipulation 或者 backtracking

Input: [3, 5, 11] (prime numbers)
Output: [3, 5, 11, 15, 33, 55, 165] (all possible product)

[3].鏈枃鍘熷垱鑷�1point3acres璁哄潧
[3]
. 鍥磋鎴戜滑@1point 3 acres
[3, 5]
[3, 5, 15]

[3, 5, 11]
[3, 5, 11, 15, 33, 55, 165]

ArrayList<Integer> primeProducts(int[] primes) {
    ArrayList<Integer> result = new ArrayList<Integer>();
    for(int i = 0 ; i < primes.length; i++){
        int len = result.length();
        result.add(primes);
        for(int j = 0; j < len ; j++){
            result.add(result.get(j) * primes);
        }
    }
    return result;
}

*/
