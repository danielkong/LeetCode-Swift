// merge sort
func mergeSort(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }
  
  let middleIdx = array.count/2 //2
  let leftArray = mergeSort(Array(array[0..<middleIdx]))
  let rightArray = mergeSort(Array(array[middleIdx..<array.count]))
  
  return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
  var leftIdx = 0
  var rightIdx = 0
  
  var res: [Int] = []
  
  while leftIdx < left.count && rightIdx < right.count {
    if left[leftIdx] < right[rightIdx] {
      res.append(left[leftIdx])
      leftIdx += 1
    } else {
      res.append(right[rightIdx])
      rightIdx += 1
    }
  }
  
  while leftIdx < left.count {
    res.append(left[leftIdx])
    leftIdx += 1
  }
  
  while rightIdx < right.count {
    res.append(right[rightIdx])
    rightIdx += 1
  }
  
  return res
}
