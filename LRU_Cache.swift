// |146|[LRU Cache](LRU_Cache.swift)
/**
Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

Follow up:
Could you do both operations in O(1) time complexity?

Example:

LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
*/

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