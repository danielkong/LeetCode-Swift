//: Playground - noun: a place where people can play

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    let sortedNums = nums.sorted()
    var res = [[Int]]()
    
    for i in 0 ..< sortedNums.count-2 {
        if i != 0 {
            if sortedNums[i] != sortedNums[i-1] {
                helper(&res, sortedNums, i)
            }
        } else {
            helper(&res, sortedNums, i)
        }
    }
    return res
}

private func helper(_ res: inout [[Int]], _ sortedNums: [Int], _ i: Int) {
    let temp = 0 - sortedNums[i]
    var l = i + 1, r = sortedNums.count-1
    while l < r {
        if sortedNums[l] + sortedNums[r] == temp {
            res.append([sortedNums[i], sortedNums[l], sortedNums[r]])
            while l+1 < sortedNums.count && sortedNums[l+1] == sortedNums[l] { l += 1 }
            l += 1
            
            while 0 < r-1 && sortedNums[r-1] == sortedNums[r] { r -= 1 }
            r -= 1
            
        } else if sortedNums[l] + sortedNums[r] > temp {
            r -= 1
        } else if sortedNums[l] + sortedNums[r] < temp {
            l += 1
        }
    }
}

let res = threeSum([0, 0, 0])

