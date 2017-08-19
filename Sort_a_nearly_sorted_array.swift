// Fix Sorted Arrays	Sort a nearly sorted (or K sorted) array
/**
You're given an array that is almost sorted, in that each of the N elements may be misplaced by no more than k positions from the correct sorted order. Find a space-and-time efficient algorithm to sort the array.

http://www.geeksforgeeks.org/nearly-sorted-algorithm/
Given an array of n elements, where each element is at most k away from its target position, devise an algorithm that sorts in O(n log k) time. 
For example, let us consider k is 2, an element at index 7 in the sorted array, can be at indexes 5, 6, 7, 8, 9 in the given array.
*/

// Naive Solution: Runtime: O(nk)
func insertionSort(_ arr: [Int], _ size: Int) {
	var key = arr[0]
	var j = 0
	for i in 1..<size {
		key = arr[i]
		j = i-1

		while j >= 0 && arr[j] > key {
			arr[j+1] = arr[j]
			j -= 1
		}
		arr[j+1] = key
	}
}

// Enhanced Solution: Use min Heap. create heap with size k+1 and time O(k), then removing element and adding new element to min heap take Log(K). O(k+(n-k)*logk)

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