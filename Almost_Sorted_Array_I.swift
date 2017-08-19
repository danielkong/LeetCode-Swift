// Almost Sorted Array I

/**
Sort an almost sorted array where only two elements are swapped
http://www.geeksforgeeks.org/sort-an-almost-sorted-array-where-only-two-elements-are-swapped/

Given an almost sorted array where only two elements are swapped, how to sort the array efficiently?

Example

Input:  arr[] = {10, 20, 60, 40, 50, 30}  
// 30 and 60 are swapped
Output: arr[] = {10, 20, 30, 40, 50, 60}

Input:  arr[] = {10, 20, 40, 30, 50, 60}  
// 30 and 40 are swapped
Output: arr[] = {10, 20, 30, 40, 50, 60}

Input:   arr[] = {1, 5, 3}
// 3 and 5 are swapped
Output:  arr[] = {1, 3, 5}
*/

// Solution: Expected time complexity is O(n) and only one swap operation to fix the array.
void sortByOneSwap(int arr[], int n)
{
    // Travers the given array from rightmost side
    for (int i = n-1; i > 0; i--)
    {
        // Check if arr[i] is not in order
        if (arr[i] < arr[i-1])
        {
            // Find the other element to be
            // swapped with arr[i]
            int j = i-1;
            while (j>=0 && arr[i] < arr[j])
                j--;
 
            // Swap the pair
            swap(arr[i], arr[j+1]);
            break;
        }
    }
}

// Swift
func sortedByOneSwap(_ arr: [Int], _ n: Int) {
	
}
