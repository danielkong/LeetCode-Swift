// 415. Add Strings     Easy

/**
    Idea: Array of characters and a carry to calculate.
*/

func addStrings(_ num1: String, _ num2: String) -> String {
    let ch1 = Array(num1.reversed())
    let ch2 = Array(num2.reversed())

    var carry = 0, i = 0, j = 0, sum = 0
    var res = String()
    while i < ch1.count || j < ch2.count || carry != 0 {
        sum = carry
        if i < ch1.count {
            sum += Int(String(ch1[i]))!
            i += 1
        }

        if j < ch2.count {
            sum += Int(String(ch2[j]))!
            j += 1
        }
        print("sum: \(sum)")
        print(sum)
        carry = sum/10
        sum %= 10

        res.append(String(sum))
        print("res: \(res)")
    }

    return String(res.reversed())
}



public class Solution {
    public String addStrings(String num1, String num2) {
        StringBuilder sb = new StringBuilder();
        int carry = 0;
        for(int i = num1.length() - 1, j = num2.length() - 1; i >= 0 || j >= 0 || carry == 1; i--, j--){
            int x = i < 0 ? 0 : num1.charAt(i) - '0';
            int y = j < 0 ? 0 : num2.charAt(j) - '0';
            sb.append((x + y + carry) % 10);
            carry = (x + y + carry) / 10;
        }
        return sb.reverse().toString();
    }
}