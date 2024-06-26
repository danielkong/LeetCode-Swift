// 215        Kth Largest Element in an Array        37.4%        Medium
/**
Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

For example,
Given [3,2,1,5,6,4] and k = 2, return 5.

Note:
You may assume k is always valid, 1 ≤ k ≤ array's length.
*/
/**
 Idea:  1. Use Swift built-in function.
            Runtime: O(NlogN)
        2. Quick-select.
            Runtime: O(N)
            https://en.wikipedia.org/wiki/Quickselect
 
 */

// Runtime: O(N)
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums, k = nums.count - k
    quicksort(&nums, 0, nums.count - 1, k)
    return nums[k]
}

func quicksort(_ a: inout [Int], _ low: Int, _ high: Int, _ k: Int) {
    if low < high {
        let pivot = a[(low+high)/2]
        let p = partition(&a, low, high, pivot)
        print("\(low), \(high), \(p), \(k)")
        if p >= k + 1 {
            quicksort(&a, low, p-1, k)
        }else if p < k + 1{
            quicksort(&a, p, high, k)
        }
    }
}

func partition(_ a: inout [Int], _ low: Int, _ high: Int, _ pivot: Int) -> Int {
    var low = low, high = high
    while low <= high {
        while a[low] < pivot { low += 1 }
        while a[high] > pivot { high -= 1 }
        if low <= high{
            a.swapAt(low, high)
            low += 1
            high -= 1
        }
    }
    return low
}

// Runtime: O(NlogN) Space: O(n)
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let test = nums.sorted()
    return test[nums.count-k]
}

// Solution: Priority Queue.
public int findKthLargest(int[] nums, int k) {

    final PriorityQueue<Integer> pq = new PriorityQueue<>();
    for(int val : nums) {
        pq.offer(val);

        if(pq.size() > k) {
            pq.poll();
        }
    }
    return pq.peek();
}

// Heap
/**
Well, this problem still has a tag "heap". If you are familiar with heapsort, you can solve this problem using the following idea:

Build a max-heap for nums, set heap_size to be nums.size();
Swap nums[0] (after buding the max-heap, it will be the largest element) with nums[heap_size - 1] (currently the last element). Then decrease heap_size by 1 and max-heapify nums (recovering its max-heap property) at index 0;
Repeat 2 for k times and the k-th largest element will be stored finally at nums[heap_size].
Now I paste my code below. If you find it tricky, I suggest you to read the Heapsort chapter of Introduction to Algorithms, which has a nice explanation of the algorithm. My code simply translates the pseudo code in that book :-)
*/

public:
    inline int left(int idx) {
        return (idx << 1) + 1;
    }
    inline int right(int idx) {
        return (idx << 1) + 2;
    }
    void max_heapify(vector<int>& nums, int idx) {
        int largest = idx;
        int l = left(idx), r = right(idx);
        if (l < heap_size && nums[l] > nums[largest]) largest = l;
        if (r < heap_size && nums[r] > nums[largest]) largest = r;
        if (largest != idx) {
            swap(nums[idx], nums[largest]);
            max_heapify(nums, largest);
        }
    }
    void build_max_heap(vector<int>& nums) {
        heap_size = nums.size();
        for (int i = (heap_size >> 1) - 1; i >= 0; i--)
            max_heapify(nums, i);
    }
    int findKthLargest(vector<int>& nums, int k) {
        build_max_heap(nums);
        for (int i = 0; i < k; i++) {
            swap(nums[0], nums[heap_size - 1]);
            heap_size--;
            max_heapify(nums, 0);
        }
        return nums[heap_size];
    }
private:
    int heap_size;
}

// Quicksort
