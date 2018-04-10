//: Playground - noun: a place where people can play

import Foundation
/*
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var arrCounter = Array(repeating: 0, count: numCourses)
        
        for temp in prerequisites {
            arrCounter[temp[0]] += 1
        }
        
        var queue = [Int]()
        
        for i in 0 ..< numCourses {
            if arrCounter[i] == 0 {
                queue.append(i)
            }
        }
        
        var res = [Int]()
        var numNoPre = queue.count
        
        print(arrCounter)
        while !queue.isEmpty {
            let c = queue.removeLast()
            res.append(c)
            print("res: \(res)")
            for temp in prerequisites {
                if temp[1] == c {
                    print("test \(temp)")
                    arrCounter[temp[0]] -= 1
                    print(arrCounter[temp[0]])
                    print(arrCounter)
                    if arrCounter[temp[0]] == 0 {
                        print("go")
                        queue.append(temp[0])
                        numNoPre += 1
                    }
                }
            }
        }
        
        if numNoPre == numCourses {
            return res
        } else {
            return res
        }
    }
 */

//class TreeNode: NSObject {
//    var left: TreeNode? = nil
//    var right: TreeNode? = nil
//    var val: Int
//    
//    init(value: Int, leftNode left:TreeNode? = nil, rightNode right:TreeNode? = nil) {
//        val = value
//        self.left = left
//        self.right = right
//    }
//}
//let five = TreeNode.init(value: 5)
//let three = TreeNode.init(value: 3)
//let one = TreeNode.init(value: 1)
//let two = TreeNode.init(value:2)
//let four = TreeNode.init(value: 4)
//
//one.right = two
//three.left = one
//three.right = four
//five.left = three
//
///**     5
//      /
//    3
//  /   \
// 1      4
//  \
//    2
// */
////let strs: [String] = binaryTreePaths(five)
////print(strs)
//
//func simplifyPath(_ path: String) -> String {
//    let dirs = path.components(separatedBy: "/")
//    var stack = [String]()
//    
//    for dir in dirs {
//        if dir == "." {
//            continue
//        } else if dir == ".." {
//            if !stack.isEmpty {
//                stack.removeLast()
//            }
//        } else {
//            if dir != "" {
//                stack.append(dir)
//            }
//        }
//    }
//    
//    var result = ""
//    guard stack.count > 0 else {
//        return "/"
//    }
//    
//    for path in stack {
//        result += "/\(path)"
//    }
//    
//    return result
//    
////    let res = stack.reduce("") { total, dir in "\(total)/\(dir)" }
////    
////    return res.isEmpty ? "/" : res
//}

/**
func minWindow2(_ s: String, _ t: String) -> String {
    let sChars = Array(s.characters)
    let sLen = sChars.count
    let tLen = t.characters.count
    
    guard sLen >= tLen else {
        return ""
    }
    
    var freqencyDict = calcCharFrec(t)
    var startIndex = 0
    var minLen = Int.max
    var count = 0
    var res = ""
    
    for (i, current) in sChars.enumerated() {
        guard freqencyDict[current] != nil else {
            continue
        }
        
        // update freqency dictionary
        freqencyDict[current]! -= 1
        if freqencyDict[current]! >= 0 {
            count += 1
        }
        
        // update startIndex
        while count == tLen {
            let startChar = sChars[startIndex]
            
            guard freqencyDict[startChar] != nil else {
                startIndex += 1
                continue
            }
            
            freqencyDict[startChar]! += 1
            if freqencyDict[startChar]! > 0 {
                // update res
                if i - startIndex + 1 < minLen {
                    res = String(sChars[startIndex ... i])
                    minLen = i - startIndex + 1
                }
                count -= 1
            }
            startIndex += 1
        }
    }
    
    return res
}

private func calcCharFrec(_ t: String) -> [Character: Int] {
    var dict = [Character: Int]()
    
    for char in t.characters {
        if let freq = dict[char] {
            dict[char] = freq + 1
        } else {
            dict[char] = 1
        }
    }
    
    return dict
}
    func minWindow(_ s: String, _ t: String) -> String {
        // hash table - key: letter value: index position
        if s.isEmpty || t.isEmpty {
            return ""
        }
        
        let tChars = Array(t.characters)
        let tLen = t.characters.count
        
        let sLen = s.characters.count
        let sChars = Array(s.characters)
        
        var targetHash = Dictionary<Character, Int>()
        for ch in tChars {
            if targetHash[ch] != nil {
                targetHash[ch]! += 1
            } else {
                targetHash[ch] = 1
            }
        }
        
        var left = 0
        var found = 0
        
        var begin = 0
        var minLength = sLen + 1
        var res = ""
        
        for (right, sch) in sChars.enumerated() {
            
            if targetHash[sch] != nil {
                targetHash[sch]! -= 1
                if targetHash[sch]! >= 0 {
                    found += 1
                }
                while found == tLen {
                    
                    guard targetHash[sch] != nil else {
                        left += 1
                        continue
                    }
                    if right - left + 1 < minLength {
                        minLength = right - left + 1
                        begin = left
                        res = String(sChars[begin ... right])
                    }
                    if targetHash[sChars[left]] != nil {
                        targetHash[sChars[left]]! += 1
                        if targetHash[sChars[left]]! > 0 {
                            found -= 1
                        }
                    }
                    left += 1
                }
            }
        }
        if minLength == sLen + 1 { return "" }
        
        return res
//        let startIdx = s.index(s.startIndex, offsetBy: begin)
//        let endIdx = s.index(s.startIndex, offsetBy: begin+minLength)
//        let range = startIdx..<endIdx
//        return s.substring(with: range)
    }

let start = Date(); // <<<<<<<<<< Start time
let test: String = minWindow("cbdccebydsdeadf","bde")
let end = Date();
let timeInterval: Double = end.timeIntervalSince(start as Date)
print(timeInterval)

let start2 = Date(); // <<<<<<<<<< Start time
let test2: String = minWindow2("cbdccebydsdeadf","bde")
let end2 = Date();
let timeInterval2: Double = end2.timeIntervalSince(start2 as Date)
print(timeInterval2)
*/

//func isMatch(_ s: String, _ p: String) -> Bool {
//    var pChars = Array(p.characters)
//    var sChars = Array(s.characters)
//    if p.isEmpty { return s.isEmpty }
//
//
//    if pChars[1] == "*" {
//        print("sdfsd2")
//
//        // let index = p.index(p.startIndex, offsetBy: 5)
//        return isMatch(s, String(pChars[2...pChars.count-1])) || !s.isEmpty && (sChars[0] == pChars[0] || "." == pChars[0]) && isMatch(String(sChars[1 ... sChars.count-1]), p)
//    } else {
//        print("sd")
////        print(String(pChars[1 ... pChars.count-1]))
//        if pChars.count > 1 && sChars.count > 1 {
//            return !s.isEmpty && (sChars[0] == pChars[0] || pChars[0] == ".") && (isMatch(String(sChars[1 ... sChars.count-1]), String(pChars[1 ... pChars.count-1])) || (sChars.count == 1 && pChars.count == 1))
//        } else {
//        
//        }
//        
//    }
//}
//
//let t = isMatch("aa", "aa")

/**
class Node {
    var key: Int
    var value: Int
    var prevNode: Node?
    var nextNode: Node?
    
    init(_ key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class doubleLinkedList {
    var head: Node?
    var tail: Node?
    
    init() {}
    
    func addToHead(_ node: Node) {
        if self.head == nil {
            self.head = node
            self.tail = node
        } else {
            let temp = self.head
            
            self.head?.prevNode = node
            self.head = node
            self.head?.nextNode = temp
        }
    }
    
    func remove(_ node: Node) {
        if node === self.head {
            
            if self.head?.nextNode != nil {
                node.nextNode?.prevNode = nil
                self.head = node.nextNode
            } else {
                self.head = nil
                self.tail = nil
            }

        } else if node.nextNode != nil {
            node.prevNode?.nextNode = node.nextNode
            node.nextNode?.prevNode = node.prevNode
        } else {
            node.prevNode?.nextNode = nil
            self.tail = node.prevNode
        }
    }
    
    func display() -> String {
        var display = ""
        var current = self.head
        while current != nil {
            display += "Key: \(current?.key), value: \(current?.value) \n"
            current = current?.nextNode
        }
        return display
    }
}

class LRU_cache {
    var capacity: Int
    var length = 0
    
    private let queue: doubleLinkedList
    private var hashTable: [Int: Node]
    init(capacity: Int) {
        self.capacity = capacity
        
        self.queue = doubleLinkedList()
        self.hashTable = [Int: Node]()
        
    }
    
    func getKey(_ key: Int) -> Int {
        if let node = self.hashTable[key] {
            queue.remove(node)
            queue.addToHead(node)
            
            return node.value
        } else {
            return -1
        }
    }
    
    func set(_ key: Int, _ value: Int) {
        if let node = self.hashTable[key] {
            node.value = value
            
            self.queue.remove(node)
            self.queue.addToHead(node)
        } else {
            let node = Node(key, value: value)
            
            if self.length < capacity {
                self.queue.addToHead(node)
                self.hashTable[key] = node
                
                self.length += 1
            } else {
                hashTable.removeValue(forKey: self.queue.tail!.key)
                self.queue.tail = self.queue.tail?.prevNode
                
                if let node = self.queue.tail {
                    node.nextNode = nil
                }
                
                self.queue.addToHead(node)
                self.hashTable[key] = node
            }
        }
    }
    
    var description: String {
        return "LRU Cache\(self.length) \n" + self.queue.display()
    }
}
 */
/*
func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    if nums.count == 1 {
        return nums[0] == target ? 0 : -1
    }
    var left = 0
    var right = nums.count-1
    
    while left < right {
        let mid = (right + left)/2
        if nums[left] == target {
            return left
        } else if nums[right] == target {
            return right
        } else if nums[mid] == target {
            return mid
        }
            // left < mid
        else if nums[left] <= nums[mid] && target < nums[mid] && target > nums[left] {
            right = mid - 1
        } else if nums[left] <= nums[mid] && (target > nums[mid] || target < nums[left]) {
            left = mid + 1
        }
            // left > mid
        else if nums[left] > nums[mid] && target > nums[mid] && target < nums[right] {
            left = mid + 1
        } else if nums[left] > nums[mid] && (target < nums[mid] || target > nums[left]) {
            right = mid - 1
        }
        else {
            return -1
        }
    }
    
    return -1
}
 */

/**
class TreeLinkNode: NSObject {
    var val: Int = 0
    let left: TreeLinkNode?
    let right: TreeLinkNode?
    var next: TreeLinkNode?
    
    init(_ value:Int, _ left: TreeLinkNode? = nil, _ right: TreeLinkNode? = nil, _ next: TreeLinkNode? = nil) {
        self.val = value
        self.left = left
        self.right = right
        self.next = next
    }
}

internal func connect(_ root: TreeLinkNode) {
    var root: TreeLinkNode? = root
    guard root != nil else {
        return
    }
    
    let dummy = TreeLinkNode(0)
    var curr = dummy
    while root != nil {
        if let left = root?.left {
            curr.next = left
            curr = curr.next!
        }
        if let right = root?.right {
            curr.next = right
            curr = curr.next!
        }
        root = root?.next
    }
    
    if root == nil {
        curr = dummy
        root = dummy.next
        dummy.next = nil
    }
}
*/
/*
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
             self.val = val
             self.next = nil
    }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else {
        return nil
    }
    var head = head
    var curr = head
    var count = 0
    
    while (curr != nil && count != k) {
        curr = curr?.next
        count += 1
    }
    
    
    if (count == k) {

        curr = reverseKGroup(curr, k)

        while count > 0 {
            let temp = head?.next
            head?.next = curr
            curr = head
            head = temp
            count -= 1
        }
        head = curr!
    }
    return head
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
node1.next = node2
node2.next = node3

let fff = reverseKGroup(node1, 2)
print(fff?.val ?? 0)
*/

/**
class TreeNode: NSObject {
    var left: TreeNode? = nil
    var right: TreeNode? = nil
    var val: Int
    
    init(_ value: Int, leftNode left:TreeNode? = nil, rightNode right:TreeNode? = nil) {
        val = value
        self.left = left
        self.right = right
    }
}

//          8
//        /   \
//       3     10
//      / \      \
//     1   6     14
//        / \    /
//       4   7  13
// 
let one = TreeNode(1, leftNode: nil, rightNode: nil)
let four = TreeNode(4, leftNode: nil, rightNode: nil)
let seven = TreeNode(7, leftNode: nil, rightNode: nil)
let six = TreeNode(6, leftNode: four, rightNode: seven)
let three = TreeNode(3, leftNode: one, rightNode: six)

let thirteen = TreeNode(13, leftNode: nil, rightNode: nil)
let fourteen = TreeNode(14, leftNode: thirteen, rightNode: nil)
let ten = TreeNode(10, leftNode: nil, rightNode: fourteen)

let root = TreeNode(8, leftNode: three, rightNode: ten)



class BSTIteratorPostOrder {
    var stack = [TreeNode]()

    internal init(_ root: TreeNode) {
        findNextLeaf(root)
    }
    
    public func findNextLeaf(_ node: TreeNode?) {
        var node = node
        
        while node != nil {
            stack.append(node!)
            if let left = node?.left {
                node = left
            }
            else {
                node = node?.right
            }
        }

    }

    public func next() -> Int {
        let temp = stack.removeLast()
        if !stack.isEmpty {
            let top = stack.last
            if temp == top?.left, let right = top?.right {
                findNextLeaf(right)
            }
        }
        
        return temp.val
    }
    
    public func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

let temp3 = BSTIteratorPostOrder(root)
temp3.next() // 1
temp3.next() // 4
temp3.next() // 7
temp3.next() // 6
temp3.next() // 3
temp3.next() // 13
temp3.next() // 14
temp3.next() // 10
temp3.next() // 8
*/

/**
func findMinArrowShots(_ points: [[Int]]) -> Int {
    guard points.count > 0 else {
        return 0
    }
    let arr = points.sorted(){ ($0[1]) < ($1[1]) }
    print(arr)
    var res = 1
    
    var tempend = arr[0][1]
    for item in arr {
        print(item)
        if item[0] > tempend {
            res += 1
            tempend = item[1]
        }
    }
    return res
}

let test = findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])
 */
/**
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount != 0 else {
        return 0
    }
    
    var dp = Array(repeating: -1, count: amount + 1)
    for i in 0 ... amount {
        for coin in coins {
            if coin == i {
                dp[i] = 1
                break
            }
            
            if coin < i && dp[i-coin] != -1 {
                if dp[i] == -1 {
                    dp[i] = dp[i-coin] + 1
                } else {
                    dp[i] = min(dp[i], dp[i-coin] + 1)
                }
            }
        }
    }
    
    return dp[amount]
}

let start = Date(); // <<<<<<<<<< Start time
let res = coinChange([186,419,83,408], 6249)
let end = Date();
let timeInterval: Double = end.timeIntervalSince(start as Date)
print(timeInterval)

*/

/**
class minHeap {
    var heapArr: [Int]
    var heap_size: Int
    
    init(_ array: [Int], _ size: Int) {
        heapArr = array
        heap_size = size
        
        var i = (heap_size-1)/2
        while i >= 0 {
            self.minHeapify(i)
            i -= 1
        }
    }
    
//    [2,6,3,12,56,8]
    
    func minHeapify(_ i: Int) {
        let l = left(i)
        print("l: \(l)")
        let r = right(i)
        var smallest = i
        
        if l < heap_size && heapArr[l] < heapArr[i] {
            smallest = l
        }
        
        if r < heap_size && heapArr[r] < heapArr[smallest] {
            smallest = r
        }
        
        print("smallest: \(smallest)")
        print("i: \(i)")
        if smallest != i {
//            let temp = heapArr[i]
//            heapArr[i] = heapArr[smallest]
//            heapArr[smallest] = temp
            swap(&heapArr[i], &heapArr[smallest])
            minHeapify(smallest)
        }
    }
    
    private func left(_ i: Int) -> Int {
        return 2*i+1
    }
    
    private func right(_ i:Int) -> Int {
        return 2*i+2
    }
    
    func replaceMin(_ x: Int) -> Int {
        let root = heapArr[0]
        heapArr[0] = x
        if root < x {
            minHeapify(0)
        }
        return root
    }
    
    func extractMin() -> Int {
        let root = heapArr[0]
        print("heap_size: \(heapArr)")
        if heap_size > 1 {
            heapArr[0] = heapArr[heap_size-1]
            heap_size -= 1
            minHeapify(0)
        }
        return root
    }
    
    func swap(_ x: inout Int, _ y: inout Int) {
        let temp = x
        x = y
        y = temp
    }
}

class Solution {
    class func nearlysortK(_ arr: inout [Int], _ size: Int, _ k: Int) {
        var tempInputArr = [Int]()
        for i in 0 ... min(size, k) {
            tempInputArr.append(arr[i])
        }
    
        let heap = minHeap(tempInputArr, k+1)
        
        var ti = 0
        for i in k+1 ..< size {
            if i < size {
                arr[ti] = heap.replaceMin(arr[i])
                print("after replace min: \(heap.heapArr)")
            }
            ti += 1
        }
        print("before extractMin arr: \(arr)")
        print("ti: \(ti)")
        print("before extractMin: \(heap.heapArr)")
        for _ in ti+1 ... size {
            arr[ti] = heap.extractMin()
            ti += 1
        }
    }
}
var array = [2,6,3,12,56,8]
Solution.nearlysortK(&array, 6, 3)

*/
/**
public func getMinScheduleTime(_ sequence: [Character], _ cooling: Int) -> Int {
    var dict = [Character: Int]()
    var timer = 0
    for ch in sequence {
        timer += 1
        if let val = dict[ch] {
            if val + cooling >= timer {
                timer = val + cooling + 1
            }
        }
        dict[ch] = timer
    }
    return timer
}

let t = Array("ABABB".characters)
let testing = getMinScheduleTime(t, 3)
 */

/*
func divide(_ dividend: Int32, _ divisor: Int32) -> Int32 {
    // special case:
    let o = Int32.min
    if divisor == 0 || (dividend == o && divisor == -1) {
        return Int32.max
    }
    
    let testing = dividend < 0 ? 1 : 0
    let testing2 = divisor < 0 ? 1 : 0

    let sign = (testing ^ testing2 == 1) ? -1 : 1
    var dvd = abs(dividend)
    let dvs = abs(divisor)
    var res: Int32 = 0
    while (dvd >= dvs) {
        var temp = dvs, multiple: Int32 = 1
        while dvd >= (temp << 1) {
            temp <<= 1
            multiple <<= 1
        }
        dvd -= temp
        res += multiple
    }
    return sign == 1 ? res: -res
}
let t = divide(-2147483648, -1)
print(Int8.min)
print(Int16.min)
print(Int32.min)
print(Int64.min)
print(Int.min)
*/
/**
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    if obstacleGrid[0][0] == 1 || obstacleGrid[m-1][n-1] == 1 { return 0 }
    if m == 1 && n == 1 && obstacleGrid[0][0] != 1 {
        return 1
    }
    
    var arr = Array(repeating: Array(repeating: 0, count: n), count: m)
    if obstacleGrid[0][0] == 0 {
        arr[0][0] = 1
    }
    
    for i in 1 ..< m {
        for j in 1 ..< n {
            if obstacleGrid[i][j] != 1 {
                arr[i][j] = arr[i-1][j] + arr[i][j-1]
            } else {
                arr[i][j] = 0
            }
            
        }
    }
    return arr[m-1][n-1]
}

let res = uniquePathsWithObstacles([[0, 0]])
 */

/**
// runtime O(n), space
func nextPermutation(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    
    var a = [-1, Int.max]
    for i in stride(from: nums.count - 1, to: 0, by: -1) {
        if nums[i] > nums[i - 1] {
            // find a number/temp > nums[i-1] in subarray nums[i ..< nums.count], swap(num[i-1], temp), then reverse subarray
            a = [i-1, nums[i - 1]]
            break
        }
    }
     if a[0] == -1 {
         nums.reverse()
         return
     }
    
    for (p, s) in nums[a[0]+1..<nums.count].enumerated() {
        if a[1] < s {
            let temp = s
            nums[a[0]+1+p] = nums[a[0]]
            nums[a[0]] = temp
        }
    }
    print(nums)
    // reverse subarray
    var j = a[0]+1
    var k = nums.count-1
    while j < k {
        let test = nums[j]
        nums[j] = nums[k]
        nums[k] = test
        j += 1
        k -= 1
    }
}

var arr = [1,3,2]
nextPermutation(&arr)
*/
/**
private func palindrome(_ str: String) -> Bool {
    let chars = Array(str.characters)
    
    var i = 0
    var j = str.characters.count - 1

    while i < j {

//        if str.subscript(str.index(str.startIndex, offsetBy: i)) == str.subscript(str.index(str.startIndex, offsetBy: j)) {
        if !((chars[i] >= "a" && chars[i] <= "z") || (chars[i] >= "A" && chars[i] <= "Z")) {
            i += 1
        }
        if !((chars[j] >= "a" && chars[j] <= "z") || (chars[j] >= "A" && chars[j] <= "Z")) {
            j -= 1
        }
        if chars[i] == chars[j] {
            i += 1
            j -= 1
        } else {
            return false
        }
    }

    return true
}

let res = palindrome("AB,A")
print(res)
*/

/**
private let dict: Dictionary<Int, [Character]> = [
    0 : [" "],
    1 : [" "],
    2: ["a", "b", "c"],
    3: ["d", "e", "f"],
    4 : ["g", "h", "i"],
    5 : ["j", "k", "l"],
    6 : ["m", "n", "o"],
    7 : ["p", "q", "r", "s"],
    8 : ["t", "u", "v"],
    9 : ["w", "x", "y", "z"]
]

private func letterCombinations(_ num: Int) -> [[Character]] {
    // int number -> digits [int]
    let arr = convertNumToNumArr(num)
    var res = [[Character]]()
    var word = [Character]()
    // digits [int] -> letter [Character]
    helper(arr, &word, &res, 1)
    
    // [Character] -> String

    return res
}

private func convertNumToNumArr(_ num: Int) -> [Int] {
    var divideTen = num
    var modTen = num
    var digits = 0
    var numArr: [Int] = []
    
    while divideTen != 0 || modTen != 0 {
        modTen = divideTen % 10
        divideTen /= 10
        
        numArr.append(modTen)
        digits += 1
    }
    
    return numArr.reversed()
}

private func helper(_ numbers: [Int], _ word: inout [Character], _ res: inout [[Character]], _ index: Int) {
    if index == numbers.count {
        res.append(word)
    } else {
        if let temp = dict[numbers[index]] {
            for ch in temp {
                word.append(ch)
                helper(numbers, &word, &res, index + 1)
                word.removeLast()
            }
            // special case last digit input is 0 or 1
//            if temp == [] && index == numbers.count - 1 {
//                res.append(word)
//            }
        }
    }
}

let res = letterCombinations(304)
print(res)

private func hammingWeight(_ n: UInt) -> Int {
    var bits = 0
    var mask: UInt = 1
    for _ in 0 ..< 32 {
        if (n & mask) != 0 {
            bits += 1
        }
        mask <<= 1
    }
    return bits
}

let res = hammingWeight(11)

public class Point {
    var x: Int
    var y: Int
    
    public init(_ xVal: Int, _ yVal: Int) {
        x = xVal
        y = yVal
    }
}

public func maxPoints(_ points: [Point]) -> Int {
    guard points.count > 2 else {
        return points.count
    }
    var dict: [Double: Int] = Dictionary()
    
    var maxNum = 0
    for i in 0 ..<  points.count {
        dict = [:]
        dict[Double(Int.min)] = 1
        var dup = 0
        for j in i+1 ..< points.count {
            if points[j].x == points[i].x && points[j].y == points[i].y {
                dup += 1
                continue
            }
            let key: Double = points[j].x - points[i].x == 0 ? Double(Int.max) : Double(Double(points[j].y - points[i].y) / Double(points[j].x - points[i].x))
            if dict[key] {
                dict[key]! += 1
            } else {
                dict[key] = 2
            }
        }
        for temp in dict.values {
            maxNum = max(maxNum, temp + dup)
        }
    }
    return maxNum
}

let points = [Point(1,1), Point(2,2), Point(3,3), Point(2,3), Point(4,6), Point(6,9), Point(8,12), Point(2,2), Point(2,2)]
let res = maxPoints(points)

*/
func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    // hash map key as Val, value as count
    // calculate sum, sum/k group means each group sum.
    
    guard nums.count > k else { return false }
    guard k != 1 else { return true }
    var sum = 0
    for num in nums {
        sum += num
    }
    if sum % k != 0 { return false }
    let groupSum = sum/k
    var dict = [Int: Int]()
    for num in nums {
        dict[num] = (dict[num] ?? 1) + 1
    }
    // dfs, if could not find a sum matched group, then return false

    var tempK = k
    print(123)
    return dfs(&dict, groupSum, &tempK)
    
    
}

private func dfs(_ dict: inout [Int: Int], _ sum: Int, _ k: inout Int) -> Bool {
    while k > 0 {
//        print(3221)
        

        for key in dict.keys {
            if key == sum {
                dict[key]! -= 1
                k -= 1
                print("-")
            } else {
                dict[key]! -= 1
                dfs(&dict, sum - dict[key]!, &k)
                dict[key]! += 1
                print("++++")

            }
        }
    }
    print(321)

    return true//k == 0
}
let res = canPartitionKSubsets([1,1,1,1,1,1,1,1,1,1], 5)
print(res)


