////: Playground - noun: a place where people can play
//func accountsMerge(_ accounts: [[String]]) -> [[String]] {
//    var owners = [String : String]()
//    var parents = [String : String]()
//    var unions = [String : Set<String>]()
//
//    // Each email parent is itself and saved in parents dict.
//    // Each email saved its owner as a[0]
//    for a in accounts {
//        for i in 1..<a.count {
//            parents[a[i]] = a[i]
//            owners[a[i]] = a[0]
//        }
//    }
//    print("parent1: \(parents)")
//    print("owners: \(owners)")
//
//    // Each account consider first email as parent, and updated parents dict.
//    for a in accounts {
//        let p = find(a[1], parents)
//        for i in 2..<a.count {
//            parents[find(a[i], parents)] = p
//        }
//    }
//    print("parent2: \(parents)")
//
//    // Union Dict. key as parent, values as a Set of emails(use set here since set could avoid duplicate)
//    for a in accounts {
//        let p = find(a[1], parents)
//        print("p : \(p)")
//
//        if unions[p] == nil {
//            unions[p] = Set<String>()
//        }
//        for i in 1..<a.count {
//            unions[p]!.insert(a[i])
//        }
//    }
//    print("unions: \(unions)")
//
//    // Combine user name (a[0]) with different emails array
//    var res = [[String]]()
//    for p in Array(unions.keys) {
//        var emails = Array(unions[p]!)
//        print(emails)
//        emails.insert(owners[p]!, at: 0)
//        res.append(emails)
//    }
//    print(res)
//    return res
//}
//
//private func find(_ s:String, _ p: [String:String]) -> String {
//    return p[s] == s ? s : find(p[s]!, p)
//}
//// Variable column size in 2d array is not supported. Column size expected to be constant size (3) but got size (2).
//let res = accountsMerge([["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]])
//
////0 ["John","johnsmith@mail.com","john_newyork@mail.com"]
////1 ["John","johnsmith@mail.com","john00@mail.com"]
////2 ["Mary","mary@mail.com"]
////3 ["John","johnnybravo@mail.com"]


//reformat phone number
//    func addBinary(_ a: String, _ b: String) -> String {
//        let ach = Array(a.characters.reversed())
//        let acount = a.characters.count
//        let bch = Array(b.characters.reversed())
//        let bcount = b.characters.count
//
//        var temp = 0
//        var res = ""
//        for i in 0..<min(acount, bcount) {
//            let (digit, test) = adding(Int(String(ach[i]))!, Int(String(bch[i]))!, temp)
//            temp = test
//            res.append(String(digit))
//        }
//        if acount == bcount {
//
//        } else if acount < bcount {
//            for i in acount..<bcount {
//                let (digit, test) = adding(0, Int(String(bch[i]))!, temp)
//                temp = test
//                res.append(String(digit))
//            }
//        } else {
//            for i in bcount..<acount {
//                let (digit, test) = adding(0, Int(String(ach[i]))!, temp)
//                temp = test
//                res.append(String(digit))
//            }
//        }
//
//        if temp == 1 {
//            res.append("1")
//        }
//        return String(res.reversed())
//    }
//
//    private func adding(_ ach: Int, _ bch: Int, _ temp: Int) -> (Int, Int) {
//        let value = ach + bch + temp
//        switch value {
//        case 0: return (0, 0)
//        case 1: return (1, 0)
//        case 2: return (0, 1)
//        case 3: return (1, 1)
//        default: return (0, 0)
//        }
//        return (0, 0)
//    }
//
//let res = addBinary("11", "1")
//
//import UIKit
//class Node: NSObject {
//    var key: Int
//    var val: Int
//    var next: Node?
//    var prev: Node?
//
//    init(key: Int, val: Int) {
//        self.key = key
//        self.val = val
//    }
//
//}
//
//class DoubleLinkedList: NSObject {
//    let capacity: Int
//    var currSize: Int
//    var head: Node?
//    var tail: Node?
//
//    init(size: Int) {
//        capacity = size
//        currSize = 0
//    }
//
//    func getTail() -> Node? {
//        return tail
//    }
//
//    func moveNodeToHead(_ node: Node?) {
//        if node == nil || node == head {
//            return
//        }
//
//        if node == tail {
//            tail = tail?.prev
//            tail?.next = nil
//        }
//
//        let prev = node?.prev
//        let next = node?.next
//        prev?.next = next
//
//        next?.prev = prev
//
//        node?.prev = nil
//        node?.next = head
//        head?.prev = node
//        head = node
//    }
//
//    func addNodeToList(_ node: Node) -> Node {
//        if head == nil {
//            head = node
//            tail = node
//            currSize = 1
//            return node
//        } else if currSize < capacity {
//            currSize += 1
//        } else {
//            tail = tail?.prev
//            tail?.next = nil
//        }
//        node.next = head
//        head?.prev=node
//        head = node
//        return node
//    }
//
//    func printList() {
//        if head == nil { return }
//        var temp = head
//        while temp != nil {
//            print(temp!.val)
//            temp = temp?.next
//        }
//    }
//}
//
//class LRUCache: NSObject {
//    let capacity: Int
//    var map = Dictionary<Int, Node>()
//    var list: DoubleLinkedList
//
//    init(size: Int) {
//        capacity = size
//        list = DoubleLinkedList.init(size: size)
//    }
//
//    func get(_ key: Int) -> Int {
//        if map[key] != nil {
//            let node = map[key]!
//            list.moveNodeToHead(node)
//           return map[key]!.val
//        }
//        return -1
//    }
//
//    func put(_ key: Int, _ val: Int) {
//        if map[key] != nil {
//            let node = map[key]!
//            list.moveNodeToHead(node)
//        } else {
//            if list.currSize == list.capacity {
//                // remove tail, and remove it from map
//                print("here")
//                map.removeValue(forKey: list.getTail()!.key)
//            }
//            let node = list.addNodeToList(Node.init(key: key, val: val))
//            map[key] = node
//            print("map: \(map.values)")
//            for test in map.values {
//                print("val: \(test.val)")
//            }
//        }
//    }
//}
//
//let test = LRUCache.init(size: 2)
//
//test.put(1, 1)
//test.put(2, 2)
//test.list.printList() // 1, 2
//test.get(1) // 1
//test.put(3, 3) // 1, 3
//test.get(2) // -1
//test.put(4, 4) // 3, 4
//test.get(1) // -1
//test.get(3) // 3
//test.get(4) // 4

//class Solution {
//    var map = [String: [String]]()
////    var test = Dictionary<String, [String]>()
//    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
//        if map[s] != nil {
//            return map[s]!
//        }
//        var res = [String]()
//        if s.count == 0 {
//            res.append("")
//            return res
//        }
//
//        for word in wordDict {
//            if s.hasPrefix(word) {
//                let sublist = wordBreak(s[word.count...], wordDict) // String(Array(s.characters)[word.count..<s.count])
//                for sub in sublist {
//                    let temp = word + (sub.isEmpty ? "" : " ") + sub
//                    res.append(temp)
//                }
//            }
//        }
//        map[s] = res
//        return res
//    }
//
//    // public class Solution {
//    // HashMap<String, LinkedList<String>> map = new HashMap<String, LinkedList<String>>();
//
//    // public List<String> wordBreak(String s, Set<String> wordDict) {
//    //     if (map.containsKey(s))
//    //         return map.get(s);
//
//    //     LinkedList<String> res = new LinkedList<String>();
//    //     if (s.length() == 0) {
//    //         res.add("");
//    //         return res;
//    //     }
//    //     for (String word : wordDict) {
//    //         if (s.startsWith(word)) {
//    //             List<String> sublist = wordBreak(s.substring(word.length()), wordDict);
//    //             for (String sub : sublist)
//    //                 res.add(word + (sub.isEmpty() ? "" : " ") + sub);
//    //         }
//    //     }
//    //     map.put(s, res);
//    //     return res;
//    // }
//    // }
//}
//func topKFrequent(_ words: [String], _ k: Int) -> [String] {
//    var map = [String: Int]()
//
//    for num in words {
//        guard let times = map[num] else {
//            map[num] = 1
//            continue
//        }
//        map[num] = times + 1
//    }
//
//    var keys = Array(map.keys)
//    keys.sort(by:{
//        let value1 = map[$0]!
//        let value2 = map[$1]!
//        if value1 != value2 {
//            return value1 > value2
//        } else {
//            // alpha
//            return
//        }
//    })
//
//    return Array(keys[0..<k])
//}
//let res = topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 2)

func groupStrings(_ strings: [String]) -> [[String]] {
    // 1. group length, each word calculate sequence
    // 2.
    // Runtime: O(n*m) Space: O(m)
    var dict = [String: [String]]()
    let a_ascii = ("a".unicodeScalars.filter{ $0.isASCII }.first?.value)!
    for str in strings {
        var key = String(str.count)
        let chs = Array(str.characters)
        let ch0 = String(Array(str.characters)[0])
        let asc = Int((ch0.unicodeScalars.filter{ $0.isASCII }.first?.value)!)
        for i in 1..<str.characters.count {
//            if str == "ba" {print("ba")}
            let asc2 = Int((chs[i].unicodeScalars.filter{ $0.isASCII }.first?.value)!)
//            if str == "ba" {
//                print("\(asc)")
//                print("\(asc2)")
//                print("\(97-98)")
//                print("\(String(asc2 - asc))")
//
//            }

            key.append(String(asc2 - asc))
        }
        print(key)
    
        if dict[key] != nil {
            dict[key]!.append(str)
        } else {
            dict[key] = [str]
        }
    }
    
    var res = [[String]]()
    for k in dict.keys {
        res.append(dict[k]!)
    }
    return res
}
//let res = groupStrings(["abc","bcd","acef","xyz","az","ba","a","z"])
let test = Array("abcd".unicodeScalars)[0]

Character(test)
//test.value
print(test)

