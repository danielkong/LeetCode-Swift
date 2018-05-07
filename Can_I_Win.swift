// 464. Can I Win
/**
In the "100 game," two players take turns adding, to a running total, any integer from 1..10. The player who first causes the running total to reach or exceed 100 wins.

What if we change the game so that players cannot re-use integers?

For example, two players might take turns drawing from a common pool of numbers of 1..15 without replacement until they reach a total >= 100.

Given an integer maxChoosableInteger and another integer desiredTotal, determine if the first player to move can force a win, assuming both players play optimally.

You can always assume that maxChoosableInteger will not be larger than 20 and desiredTotal will not be larger than 300.

Example

    Input:
        maxChoosableInteger = 10
        desiredTotal = 11

    Output:
        false

    Explanation:
        No matter which integer the first player choose, the first player will lose.
        The first player can choose an integer from 1 up to 10.
        If the first player choose 1, the second player can only choose integers from 2 up to 10.
        The second player will win by choosing 10 and get a total = 11, which is >= desiredTotal.
        Same with other integers chosen by the first player, the second player will always win.
*/
/**
    Idea: Top-Down DP, which 'brute-force' simulates all possibble states of the game.
          To avoid repeat solve sub-problems, we use dictionary to save outcome.
          By doing this, runtime from O(N!) to O(2^N)
    Runtime: O()
*/
class Solution {
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        // dp
        let sum = (1+maxChoosableInteger)*maxChoosableInteger/2
        if sum < desiredTotal { return false }
        
        if maxChoosableInteger >= desiredTotal { return true }
        if desiredTotal <= 0 { return false }
        var map = [Int: Bool]()
        return helper(maxChoosableInteger, 0, desiredTotal, &map)
    }
    
    private func helper(_ max: Int, _ state: Int, _ total: Int, _ map: inout [Int: Bool]) -> Bool {
        if total <= 0 { return false }
        if map[state] != nil { return map[state]! }
        for i in 0..<max {
            if (state & (1<<i)) == 0 { // check which number is not used
                let t = state | (1<<i) // next state 
                if !helper(max, t , total-(max-i), &map) { // if opponent loses, we win
                    map[state] = true 
                    return true
                }
            }
        }
        map[state] = false // if we can't win
        return false
    }
}
/**
class Solution {
    public boolean canIWin(int maxChoosableInteger, int desiredTotal) {
        if(((1+maxChoosableInteger)*maxChoosableInteger)/2<desiredTotal) return false;
        if(desiredTotal<=0) return true;
        HashMap<Integer,Boolean> map = new HashMap<>();
        return helper(maxChoosableInteger, 0, desiredTotal, map);
    }
    
    public boolean helper(int max, int state, int total, HashMap<Integer,Boolean> map){
        if(total<=0) return false;
        if(map.containsKey(state)) return map.get(state);
        for(int i=0; i<max; i++){
            if((state&(1<<i))==0){ // check which number is not used
                int t = state | (1<<i); // next state 
                if(!helper(max,t,total-(max-i),map)){ // if opponent loses, we win
                    map.put(state,true);
                    return true;
                }
            }
        }
        map.put(state,false); // if we can't win
        return false;
    }
}
*/