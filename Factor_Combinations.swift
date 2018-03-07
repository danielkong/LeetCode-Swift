// 254. Factor Combinations
/**
Numbers can be regarded as product of its factors. For example,

8 = 2 x 2 x 2;
  = 2 x 4.
Write a function that takes an integer n and return all possible combinations of its factors.

Note: 
You may assume that n is always positive.
Factors should be greater than 1 and less than n.
Examples: 
input: 1
output: 
[]
input: 37
output: 
[]
input: 12
output:
[
  [2, 6],
  [2, 2, 3],
  [3, 4]
]
input: 32
output:
[
  [2, 16],
  [2, 2, 8],
  [2, 2, 2, 4],
  [2, 2, 2, 2, 2],
  [2, 4, 4],
  [4, 8]
]
*/

// java solution
public List<List<Integer>> getFactors(int n) {
    List<List<Integer>> result = new ArrayList<List<Integer>>();
    helper(result, new ArrayList<Integer>(), n, 2);
    return result;
}

public void helper(List<List<Integer>> result, List<Integer> item, int n, int start){
    if (n <= 1) {
        if (item.size() > 1) {
            result.add(new ArrayList<Integer>(item));
        }
        return;
    }
    
    for (int i = start; i <= n; ++i) {
        if (n % i == 0) {
            item.add(i);
            helper(result, item, n/i, i);
            item.remove(item.size()-1);
        }
    }
}

// swift solution
// runtime: O()
class Solution {
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var list = [Int]()
        helper(&res, &list, n, 2)
        return res
    }
    
    private func helper(_ res: inout [[Int]], _ list: inout [Int], _ n: Int, _ start: Int) {
        if n<=1 {
            if list.count > 1 {
                res.append(list)
            }
            return
        }
        guard start <= n else { return }
        for i in start...n {
            if n%i == 0 {
                list.append(i)
                helper(&res,&list, n/i, i)
                list.removeLast()
            }
        }
    }
}

// best solution 
class Solution {
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        if n < 4 { return res }
        dfs(&res, [], n, 2)
        return res
    }
    
    private func dfs(_ res:inout[[Int]], _ path:[Int], _ n:Int, _ start:Int) {
        let sroot = Int(ceil(sqrt(Double(n))))
        if start <= sroot {
            for i in start...sroot where n%i == 0 && n/i >= i {
                res.append(path+[i]+[n/i])
                dfs(&res, path+[i], n/i, i)
            }
        }
    }
}