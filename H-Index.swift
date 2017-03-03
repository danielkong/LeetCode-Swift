// 274. H-Index 1 & 2
/**
Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."

For example, given citations = [3, 0, 6, 1, 5], which means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively. Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, his h-index is 3.

Note: If there are several possible values for h, the maximum one is taken as the h-index.
*/
// Solution: 1. Time O(n) Space O(n). bucket sort.

    func hIndex(_ citations: [Int]) -> Int {
        let length = citations.count
        guard length > 0 else {
            return 0
        }
        
        var h = 0
        var arr = Array(repeating:0, count: length+1)
        
        for c in citations {
            if c > length {
                arr[length] += 1  
            } else {
                arr[c] += 1
            }
        }
        
        var t = 0
        var res = 0
        // for (idx, a) in arr.reversed().enumerated() {
        for index in stride(from: length, to: 0, by: -1) {
            t = t + arr[index]
            if t >= index {
                return index    
            }
        }
        return 0
    }

// Solution: 2. Time O(nLog(n)), space O(1). Sort first, then Binary search

public class Solution {
    public int hIndex(int[] citations) {
        if(citations == null || citations.length == 0) return 0;
        int l = 0, r = citations.length;
        int n = citations.length;
        while(l < r){
            int mid = l + (r - l) / 2;
            if(citations[mid] == n - mid) return n - mid;
            if(citations[mid] < citations.length - mid) l = mid + 1;
            else r = mid;
        }
        return n - l;
    }
}