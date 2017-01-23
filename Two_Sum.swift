//	Two Sum        29.8%        Easy        

// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution.
//
// Example:
// Given nums = [2, 7, 11, 15], target = 9,
//
// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1].
// UPDATE (2016/2/13):
// The return format had been changed to zero-based indices. Please read the above updated description carefully.

// Solution: sort array? No! since we return index, not value!

func twoSum(_ arr: [Int], target: Int) -> [Int] {
    var dict = [Int: Int]()
    var result = [Int]()
//    for (index, value) in arr.enumerated() {
//        dict[value] = index
//    }
    for i in 0..<arr.count {
        if dict[target-arr[i]] != nil {
            result.append(i)
            result.append(dict[target-arr[i]]!)
            break
        } else {
            dict[arr[i]] = i
        }
    }
    
    return result
}

// Java version
    public int[] twoSum(int[] numbers, int target) {
    HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
    int[] result = new int[2];
 
    for (int i = 0; i < numbers.length; i++) {
        if (map.containsKey(numbers[i])) {
            int index = map.get(numbers[i]);
            result[0] = index ;
            result[1] = i;
            break;
        } else {
            map.put(target - numbers[i], i);
        }
    }
 
    return result;
    }