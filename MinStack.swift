// 155. Min Stack
/**
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

push(x) -- Push element x onto stack.
pop() -- Removes the element on top of the stack.
top() -- Get the top element.
getMin() -- Retrieve the minimum element in the stack.

Example:
	MinStack minStack = new MinStack();
	minStack.push(-2);
	minStack.push(0);
	minStack.push(-3);
	minStack.getMin();   --> Returns -3.
	minStack.pop();
	minStack.top();      --> Returns 0.
	minStack.getMin();   --> Returns -2.
*/
/**
 Solution 1: Use two stacks. one general stack, one store min stack to provide previous min when 	current min pop.
 Solution 2: Use one stack and one min_val. one stack, when push new min value, push min_val first then push new min. Then, at pop min_val, current stack.peek is new min_val.
 */
class MinStack {

    /** initialize your data structure here. */
    // as push happen, one array record index of min value, then `getMin` always
    var minIndex = [Int]()
    var stack = [Int]()

    init() {
        stack = []
        minIndex = []
    }

    func push(_ x: Int) {
        stack.append(x)
        updateMinIndex(x)
    }

    func pop() {
        stack.removeLast()
        minIndex.removeLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        guard let la = minIndex.last else { return -1 }
        return stack[la]
    }

    func updateMinIndex(_ val:Int) {
        if minIndex.count == 0 {
            minIndex.append(0)
            return
        }
        let la = minIndex.count - 1
        if val > stack[minIndex[la]] {
            minIndex.append(minIndex[la])
        } else {
            minIndex.append(minIndex.count)
        }
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */