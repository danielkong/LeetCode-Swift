// Find Median Among Arrays, leetcode Median of Two Sorted Arrays
/**
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log(m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
*/

/**
将原问题转变成一个寻找第k小数的问题（假设两个原序列升序排列），这样中位数实际上是第(m+n)/2小的数。所以只要解决了第k小数的问题，原问题也得以解决。

首先假设数组A和B的元素个数都大于k/2，我们比较A[k/2-1]和B[k/2-1]两个元素，这两个元素分别表示A的第k/2小的元素和B的第k/2小的元素。这两个元素比较共有三种情况：>、<和=。如果A[k/2-1]<B[k/2-1]，这表示A[0]到A[k/2-1]的元素都在A和B合并之后的前k小的元素中。换句话说，A[k/2-1]不可能大于两数组合并之后的第k小值，所以我们可以将其抛弃。

证明也很简单，可以采用反证法。假设A[k/2-1]大于合并之后的第k小值，我们不妨假定其为第（k+1）小值。由于A[k/2-1]小于B[k/2-1]，所以B[k/2-1]至少是第（k+2）小值。但实际上，在A中至多存在k/2-1个元素小于A[k/2-1]，B中也至多存在k/2-1个元素小于A[k/2-1]，所以小于A[k/2-1]的元素个数至多有k/2+ k/2-2，小于k，这与A[k/2-1]是第（k+1）的数矛盾。

当A[k/2-1]>B[k/2-1]时存在类似的结论。

当A[k/2-1]=B[k/2-1]时，我们已经找到了第k小的数，也即这个相等的元素，我们将其记为m。由于在A和B中分别有k/2-1个元素小于m，所以m即是第k小的数。(这里可能有人会有疑问，如果k为奇数，则m不是中位数。这里是进行了理想化考虑，在实际代码中略有不同，是先求k/2，然后利用k-k/2获得另一个数。)

通过上面的分析，我们即可以采用递归的方式实现寻找第k小的数。此外我们还需要考虑几个边界条件：

如果A或者B为空，则直接返回B[k-1]或者A[k-1]；
如果k为1，我们只需要返回A[0]和B[0]中的较小值；
如果A[k/2-1]=B[k/2-1]，返回其中一个；
*/

// Solution: Runtime 每次缩小范围之后k值基本上折半，故时间复杂度O(logn).
public double findMedianSortedArrays(int[] nums1, int[] nums2) {
    int N1 = nums1.length, N2 = nums2.length;
    if (N1 > N2) return findMedianSortedArrays(nums2, nums1);

    int lo = 0, hi = 2 * N1;
    while (lo <= hi) {
        int C1 = (lo + hi) / 2;
        int C2 = N1 + N2 - C1;

        double L1 = (C1 == 0) ? Integer.MIN_VALUE : nums1[(C1-1)/2];
        double R1 = (C1 == 2*N1) ? Integer.MAX_VALUE : nums1[C1/2];
        double L2 = (C2 == 0) ? Integer.MIN_VALUE : nums2[(C2-1)/2];
        double R2 = (C2 == 2*N2) ? Integer.MAX_VALUE : nums2[C2/2];

        if (L1 > R2) hi = C1 - 1;
        else if (L2 > R1) lo = C1 + 1;
        else return (Math.max(L1, L2) + Math.min(R1, R2)) / 2;
    }
    return -1;
}

// Solution 2: Shortest line Solution

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
      let merge = (nums1 + nums2).sorted(), n = merge.count
      return n % 2 != 0 ? Double(merge[(n - 1) / 2]) : Double(merge[(n - 1) / 2] + merge[n / 2]) / 2
    }
}

// Solution 3:
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
      let (c1, c2) = (nums1.count, nums2.count), mid = (c1 + c2 + 1) / 2
      if c1 > c2 { return findMedianSortedArrays(nums2, nums1) }
      var t = (min: 0, max: c1)
      while t.min <= t.max {
        let i = (t.min + t.max) / 2
        let j = mid - i
        guard !(j > 0 && i < c1 && nums2[j-1] > nums1[i]) else { t.min = i + 1; continue }
        guard !(i > 0 && j < c2 && nums1[i-1] > nums2[j]) else { t.max = i - 1; continue }
        let leftMax = i == 0 ? nums2[j - 1] : j == 0 ? nums1[i-1] : max(nums1[i - 1], nums2[j - 1])
        guard (c1 + c2) % 2 == 0 else { return Double(leftMax) }
        let rightMin = i == c1 ? nums2[j] : j == c2 ? nums1[i] : min(nums1[i], nums2[j])
        return Double(leftMax + rightMin) / 2.0
      }
      return 0.0
    }
}
// Solution 4: Time Complexity: O(log(m + n)), Space Complexity: O(1)
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
	let m = nums1.count
	let n = nums2.count

	return (findKth(nums1, nums2, (m + n + 1) / 2) + findKth(nums1, nums2, (m + n + 2) / 2)) / 2
}

private func findKth(_ nums1: [Int], _ nums2: [Int], _ index: Int) -> Double {
	let m = nums1.count
	let n = nums2.count

	guard m <= n else {
		return findKth(nums2, nums1, index)
	}
	guard m != 0 else {
		return Double(nums2[index - 1])
	}
	guard index != 1 else {
		return Double(min(nums1[0], nums2[0]))
	}

	let i = min(index / 2, m)
	let j = min(index / 2, n)

	if nums1[i - 1] < nums2[j - 1] {
		return findKth(Array(nums1[i ..< m]), nums2, index - i)
	} else {
		return findKth(nums1, Array(nums2[j ..< n]), index - j)
	}
}
