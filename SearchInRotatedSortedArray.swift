// 33. Search in Rotated Sorted Array
/**
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.
*/

// Solution: Binary Search

    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var res = -1
        var left = 0
        var right = nums.count-1
        while left <= right {
            var mid = (left + right)/2
            if nums[mid] == target { return mid }
            else if nums[mid] >= nums[left] {
                if target >= nums[left] && target < nums[mid] {
                    right = mid-1
                } else {
                    left = mid+1
                }
            } else {
                if target <= nums[right] && target > nums[mid] {
                    left = mid+1
                } else {
                    right = mid-1
                }
            }
        }
        return -1
    }


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
            var mid = (left + right)/2

            if nums[left] == target {
                return left
            } else if nums[right] == target {
                return right
            } else if nums[mid] == target {
                return mid
            } else 
            // left < mid
            if nums[left] <= nums[mid] && target < nums[mid] && target > nums[left] {
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
            // [5,1,3], 4
            else {
                return -1
            }
        }

        return -1
    }