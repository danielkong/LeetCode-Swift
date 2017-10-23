// 681. Next Closest Time

/**
Given a time represented in the format "HH:MM", form the next closest time by reusing the current digits.
There is no limit on how many times a digit can be reused.

You may assume the given input string is always valid.
For example, "01:34", "12:09" are all valid. "1:34", "12:9" are all invalid.

Example 1:

Input: "19:34"
Output: "19:39"
Explanation: The next closest time choosing from digits 1, 9, 3, 4, is 19:39, which occurs 5 minutes later.
It is not 19:33, because this occurs 23 hours and 59 minutes later.

Example 2:

Input: "23:59"
Output: "22:22"
Explanation: The next closest time choosing from digits 2, 3, 5, 9, is 22:22.
It may be assumed that the returned time is next day's time since it is smaller than the input time numerically.

*/

// Swift Solution
class Solution {
    func nextClosestTime(_ time: String) -> String {
        var nums = [Int]()
        for ch in Array(time.characters) {
            if ch <= "9" && ch >= "0" {
                nums.append(Int(String(ch))!)
            }
        }
        let minute = nums[2]*10 + nums[3]

        let largerMin = helper(minute, nums)

        if largerMin != -1 && largerMin < 60 {
    //        return "has larger min"
            let largerMin = largerMin < 10 ? "0"+String(largerMin) : String(largerMin)
            return String(nums[0]) + String(nums[1]) + ":" + String(largerMin)
        } else {
            // need find hour
            let hour = nums[0]*10+nums[1]
            let largerHour = helper(hour, nums)
            if largerHour != -1 && largerHour < 24 {

                let hourstr = largerHour < 10 ? "0"+String(largerHour) : String(largerHour)
                let sortedNums = nums.sorted()
                let minNum = String(sortedNums[0])
                return hourstr + ":" + minNum + minNum
    //            return "has larger hour"

            } else {
                // no larger hour
                let sortedNums = nums.sorted()
                let minNum = String(sortedNums[0])
                return minNum + minNum + ":" + minNum + minNum
    //            return "no larger hour"
            }
        }
        return ""
    }

    func helper(_ test: Int, _ nums: [Int]) -> Int {

        var res = [Int]()
        for i in nums {
            for j in nums {
                let temp = i * 10 + j
                if temp > test {
                    res.append(temp)
                }
            }
        }
        let sorted = res.sorted()

        if sorted.count > 0 {
            return sorted[0]
        } else {
            return -1
        }
        return -1
    }
}
// Swift Solution
func nextClosestTime(_ time: String) -> String {

	var maxPerDigit = [2,9,0,5,9]

	var arr = Array(time.characters)
	let mini = arr.min()!
	let mini1 = arr.filter{$0 != mini}.min()
	let mini2 = arr.filter{$0 != mini && $0 != mini1}.min()
	let maxi = max(arr[0...1].max()!, arr[3...4].max()!)

	var nextHigh = [Character:Character]()
	nextHigh[mini] = mini1
	nextHigh[mini1 ?? mini] = mini2
	nextHigh[mini2 ?? mini] = maxi

	if arr.first! > "1" {
		maxPerDigit[1] = 3
	}

	var minimiseIdx = 0
	for i in (0...4).reversed() {

		if i==2 { continue }

		let val = arr[i]
		if val==maxi || Int(String(val))==maxPerDigit[i] { continue }

		if let nxtHigh = nextHigh[val], Int(String(nxtHigh))! <= maxPerDigit[i] {

			arr[i] = nxtHigh
			minimiseIdx = i+1
			break;
		}
	}

	for i in minimiseIdx..<5 {
		if i==2 { continue }
		arr[i] = mini
	}

	return String(arr)
}
