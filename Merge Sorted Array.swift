// 88        Merge Sorted Array        31.4%        Easy    

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m-1, j = n-1, k = m+n-1
        while i >= 0 && j >= 0 {
            if nums1[i] < nums2[j] {
                nums1[k] = nums2[j]
                j -= 1
            } else {
                nums1[k] = nums1[i]
                i -= 1
            }
            k -= 1
        }
        while j >= 0 {
            nums1[j] = nums2[j]
            j -= 1
        }
    }

//    Solution 2
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1

        while i >= 0 || j >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }

