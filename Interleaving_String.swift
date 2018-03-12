97. Interleaving String
/**
Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

For example,
Given:
s1 = "aabcc",
s2 = "dbbca",

When s3 = "aadbbcbcac", return true.
When s3 = "aadbbbaccc", return false.
*/
// Solution: Runtime: O(m*n), Space: O(m*n)
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s3.count != s1.count + s2.count { return false }
        var res = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
        
        var ch1 = Array(s1)
        var ch2 = Array(s2)
        var ch3 = Array(s3)

        for i in 0...s1.count {
            for j in 0...s2.count {
                if i==0 && j==0 {
                    res[i][j] = true
                } else if i==0 {
                    res[i][j] = (res[i][j-1] && ch2[j-1] == ch3[i+j-1])
                } else if j==0 {
                    res[i][j] = (res[i-1][j] && ch1[i-1] == ch3[i+j-1])
                } else {
                    res[i][j] = (res[i-1][j] && ch1[i-1] == ch3[i+j-1]) || (res[i][j-1] && ch2[j-1] == ch3[i+j-1])
                }
            }
        }
        return res[s1.count][s2.count]
    }

// Solution: Java
bool isInterleave(string s1, string s2, string s3) {
    
    if(s3.length() != s1.length() + s2.length())
        return false;
    
    bool table[s1.length()+1][s2.length()+1];
    
    for(int i=0; i<s1.length()+1; i++)
        for(int j=0; j< s2.length()+1; j++){
            if(i==0 && j==0)
                table[i][j] = true;
            else if(i == 0)
                table[i][j] = ( table[i][j-1] && s2[j-1] == s3[i+j-1]);
            else if(j == 0)
                table[i][j] = ( table[i-1][j] && s1[i-1] == s3[i+j-1]);
            else
                table[i][j] = (table[i-1][j] && s1[i-1] == s3[i+j-1] ) || (table[i][j-1] && s2[j-1] == s3[i+j-1] );
        }
        
    return table[s1.length()][s2.length()];
}