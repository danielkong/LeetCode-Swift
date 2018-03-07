// 146. LRU Cache
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

/**
Solution: 
Cache Design Problem. 

Caches are used to hold objects in memory. A caches size is finite; If the system doesn't have enough memory, the cache must be purged or the program will crash.

The key to the LRU cache is the priority queue. For simplicity, you'll model the queue using a linked list. All interactions with the LRU cache should respect this queue; Calling get and set should update the priority queue to reflect the most recently accessed element.
	All operations are O(lg n).
	Just like a heap can be a max-heap or min-heap, the queue can be a max-priority queue (largest element first) or a min-priority queue (smallest element first).


Best solution: Double linked list and hashmap

Typically LRU cache is implemented using a doubly linked list and a hash map.
Doubly Linked List is used to store list of pages with most recently used page at the start of the list. So, as more pages are added to the list, least recently used pages are moved to the end of the list with page at tail being the least recently used page in the list.
Hash Map (key: page number, value: page) is used for O(1) access to pages in cache

When a page is accessed, there can be 2 cases:
1. Page is present in the cache - If the page is already present in the cache, we move the page to the start of the list.
2. Page is not present in the cache - If the page is not present in the cache, we add the page to the list. 
How to add a page to the list:
   a. If the cache is not full, add the new page to the start of the list.
   b. If the cache is full, remove the last node of the linked list and move the new page to the start of the list.

*/

class LRUCache {
    public LRUCache(int capacity) {
        
    }
    
    public int get(int key) {
        
    }
    
    public void put(int key, int value) {
        if 
    }
}

// Best solution Java: last is best solution in swift
import java.util.HashMap;
import java.util.Map;
 
public class LRUCache {
     
    private DoublyLinkedList pageList;
    private Map<Integer, Node> pageMap;
    private final int cacheSize;
     
    public LRUCache(int cacheSize) {
        this.cacheSize = cacheSize;
        pageList = new DoublyLinkedList(cacheSize);
        pageMap = new HashMap<Integer, Node>();
    }
     
    public void accessPage(int pageNumber) {
        Node pageNode = null;
        if(pageMap.containsKey(pageNumber)) {
            // If page is present in the cache, move the page to the start of list
            pageNode = pageMap.get(pageNumber);
            pageList.movePageToHead(pageNode);
        } else {
            // If the page is not present in the cache, add the page to the cache
            if(pageList.getCurrSize() == pageList.getSize()) {
                // If cache is full, we will remove the tail from the cache pageList
                // Remove it from map too
                pageMap.remove(pageList.getTail().getPageNumber());
            }
            pageNode = pageList.addPageToList(pageNumber);
            pageMap.put(pageNumber, pageNode);
        }
    }
     
    public void printCacheState() {
        pageList.printList();
        System.out.println();
    }
 
    public static void main(String[] args) {
        int cacheSize = 4;
        LRUCache cache = new LRUCache(cacheSize);
        cache.accessPage(4);
        cache.printCacheState();
        cache.accessPage(2);
        cache.printCacheState();
        cache.accessPage(1);
        cache.printCacheState();
        cache.accessPage(1);
        cache.printCacheState();
        cache.accessPage(4);
        cache.printCacheState();
        cache.accessPage(3);
        cache.printCacheState();
        cache.accessPage(7);
        cache.printCacheState();
        cache.accessPage(8);
        cache.printCacheState();
        cache.accessPage(3);
        cache.printCacheState();
    }
}
 
class DoublyLinkedList {
     
    private final int size;
    private int currSize;
    private Node head;
    private Node tail;
 
    public DoublyLinkedList(int size) {
        this.size = size;
        currSize = 0;
    }
 
    public Node getTail() {
        return tail;
    }
 
    public void printList() {
        if(head == null) {
            return;
        }
        Node tmp = head;
        while(tmp != null) {
            System.out.print(tmp);
            tmp = tmp.getNext();
        }
    }
 
    public Node addPageToList(int pageNumber) {
        Node pageNode = new Node(pageNumber);       
        if(head == null) {
            head = pageNode;
            tail = pageNode; 
            currSize = 1;
            return pageNode;
        } else if(currSize < size) {
            currSize++;
        } else {
            tail = tail.getPrev();
            tail.setNext(null);
        }
        pageNode.setNext(head);
        head.setPrev(pageNode);
        head = pageNode;
        return pageNode;
    }
 
    public void movePageToHead(Node pageNode) {
        if(pageNode == null || pageNode == head) {
            return;
        }
 
        if(pageNode == tail) {
            tail = tail.getPrev();
            tail.setNext(null);
        }
         
        Node prev = pageNode.getPrev();
        Node next = pageNode.getNext();
        prev.setNext(next);
 
        if(next != null) {
            next.setPrev(prev);
        }
 
        pageNode.setPrev(null);
        pageNode.setNext(head);
        head.setPrev(pageNode);
        head = pageNode;    
    }
 
    public int getCurrSize() {
        return currSize;
    }
 
    public void setCurrSize(int currSize) {
        this.currSize = currSize;
    }
 
    public Node getHead() {
        return head;
    }
 
    public void setHead(Node head) {
        this.head = head;
    }
 
    public int getSize() {
        return size;
    }   
}
 
class Node {
     
    private int pageNumber;
    private Node prev;
    private Node next;
     
    public Node(int pageNumber) {
        this.pageNumber = pageNumber;
    }
 
    public int getPageNumber() {
        return pageNumber;
    }
 
    public void setPageNumber(int data) {
        this.pageNumber = data;
    }
     
    public Node getPrev() {
        return prev;
    }
 
    public void setPrev(Node prev) {
        this.prev = prev;
    }
 
    public Node getNext() {
        return next;
    }
 
    public void setNext(Node next) {
        this.next = next;
    }
     
    public String toString() {
        return pageNumber + "  ";
    }
}

// Best solution in swift
// runtime O(1) getKey and putKeyValue
import UIKit
class Node: NSObject {
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?
    
    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
    
}

class DoubleLinkedList: NSObject {
    let capacity: Int
    var currSize: Int
    var head: Node?
    var tail: Node?
    
    init(size: Int) {
        capacity = size
        currSize = 0
    }
    
    func getTail() -> Node? {
        return tail
    }
    
    func moveNodeToHead(_ node: Node?) {
        if node == nil || node == head {
            return
        }
        
        if node == tail {
            tail = tail?.prev
            tail?.next = nil
        }
        
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        
        next?.prev = prev
        
        node?.prev = nil
        node?.next = head
        head?.prev = node
        head = node
    }
    
    func addNodeToList(_ node: Node) -> Node {
        if head == nil {
            head = node
            tail = node
            currSize = 1
            return node
        } else if currSize < capacity {
            currSize += 1
        } else {
            tail = tail?.prev
            tail?.next = nil
        }
        node.next = head
        head?.prev=node
        head = node
        return node
    }
    
    func printList() {
        if head == nil { return }
        var temp = head
        while temp != nil {
            print(temp!.val)
            temp = temp?.next
        }
    }
}

class LRUCache: NSObject {
    let capacity: Int
    var map = Dictionary<Int, Node>()
    var list: DoubleLinkedList
    
    init(size: Int) {
        capacity = size
        list = DoubleLinkedList.init(size: size)
    }
    
    func get(_ key: Int) -> Int {
        if map[key] != nil {
            let node = map[key]!
            list.moveNodeToHead(node)
           return map[key]!.val
        }
        return -1
    }
    
    func put(_ key: Int, _ val: Int) {
        if map[key] != nil {
            let node = map[key]!
            list.moveNodeToHead(node)
        } else {
            if list.currSize == list.capacity {
                // remove tail, and remove it from map
                print("here")
                map.removeValue(forKey: list.getTail()!.key)
            }
            let node = list.addNodeToList(Node.init(key: key, val: val))
            map[key] = node
            print("map: \(map.values)")
            for test in map.values {
                print("val: \(test.val)")
            }
        }
    }
}

let test = LRUCache.init(size: 2)

test.put(1, 1)
test.put(2, 2)
test.list.printList() // 1, 2
test.get(1) // 1
test.put(3, 3) // 1, 3
test.get(2) // -1
test.put(4, 4) // 3, 4
test.get(1) // -1
test.get(3) // 3
test.get(4) // 4



