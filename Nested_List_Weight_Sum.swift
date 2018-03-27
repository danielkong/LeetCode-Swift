// 339. Nested List Weight Sum
/**
Given a nested list of integers, return the sum of all integers in the list weighted by their depth.

Each element is either an integer, or a list -- whose elements may also be integers or other lists.

Example 1:
Given the list [[1,1],2,[1,1]], return 10. (four 1's at depth 2, one 2 at depth 1)

Example 2:
Given the list [1,[4,[6]]], return 27. (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27)
*/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
 // Runtime: O(n) <all numbers in whole list>, Space: O(depth of nested level)
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        return depthSum(nestedList, 1)
    }

    private func depthSum(_ nestedList: [NestedInteger], _ n: Int) -> Int {
        var sum = 0
        for list in nestedList {
            if list.isInteger() {
                sum += list.getInteger() * n
            } else {
                sum += depthSum(list.getList(), n+1)
            }
        }
        return sum
    }
}

// Solution Swift: DFS. Use tuple track depth and runtime O(N), space O(1)
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var res = 0
        var queue: [([NestedInteger], Int)] = [(nestedList, 1)]
        
        while queue.count != 0 {
            let temp = queue.removeLast()
            var nextLevel: [NestedInteger] = []
            for item in temp.0 {
                if item.isInteger() {
                    res += item.getInteger() * temp.1
                } else {
                    queue.append((item.getList(), (temp.1 + 1)))
                }
            }
        }
        return res
    }
}
