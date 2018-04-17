// 170. Two Sum III - Data structure design
/**

Design and implement a TwoSum class. It should support the following operations: add and find.

add - Add the number to an internal data structure.
find - Find if there exists any pair of numbers which sum is equal to the value.

For example,
add(1); add(3); add(5);
find(4) -> true
find(7) -> false

*/
/**
Analysis: 	How about add duplicates?   Set or HashMap
			How about runtime for each function

	Idea: 	Dictionary - Add O(1), Find O(N) -- N means all keys

*/ 

class TwoSum {
	var dict = [Int: Int]()

	func add(_ num: Int) {
		if dict[num] != nil {
			dict[num]! += 1
		} else {
			dict[num] = 1
		}
	}

	func find(_ target: Int) {
		for key in dict.keys {
			// if does not allow dup plus, then add `t-key != key`
			if dict[target - key] != nil { 
				return true
			}
		}
		return false
	}
}


// Solution Java

class TwoSum {
    Map<Integer,Integer> hm;
    
    TwoSum(){
        hm = new HashMap<Integer,Integer>();
    }
    // Add the number to an internal data structure.
	public void add(int number) {
	    if(hm.containsKey(number)){
	        hm.put(number,2);
	    }else{
	        hm.put(number,1);
	    }
	}

    // Find if there exists any pair of numbers which sum is equal to the value.
	public boolean find(int value) {
	    Iterator<Integer> iter = hm.keySet().iterator();
	    while(iter.hasNext()){
	        int num1 = iter.next();
	        int num2 = value - num1;
	        if(hm.containsKey(num2)){
	            if(num1 != num2 || hm.get(num2) == 2){
	                return true;
	            }
	        }
	    }
	    return false;
	}
}