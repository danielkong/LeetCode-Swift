# iOS Leetcode
## Data Structures
* [Array](#array)
* [String](#string)
* [Tree](#tree)
* [Stack](#stack)
* [Queue](#queue)
* [Heap](#Heap)
* [Priority Queue](#Priority-Queue)
* [Dynamic programming](#dynamic-programming)
* [Depth-first search](#depth-first-search)
* [Breadth-first search](#breadth-first-search)
* [Graph](#graph)

## Array

Swift native func performance:

- void `sort()` Time complexity:  O(**n** log **n**), where **n** is the length of the collection.

- [Element] `sorted()` Time complexity: O(**n** log **n**), where **n** is the length of the sequence.

void `reverse()` Time complexity: O(**n**), where **n** is the number of elements.

[Element] `reversed()` Time complexity: O(1).

| Number | Question   | Time  | Space | Difficulty | Done |
| ------ |:----------:| -----:|----:|:-------:| :----: |
| 33 | [Search in rotated sorted array](./SearchInRotatedSortedArray.swift)| O(logN) | O(1)    | Medium |  |
| 523 | [Continuous Subarray Sum](./ContinuousSubarraySum.swift)| O(N) | O(1)    | Medium |  |
| 636 | [Exclusive time of functions](./ExclusiveTimeofFunctions.swift)| O(N) | O(1)    | Medium |  |
| 621 | [Task Scheduler](./TaskScheduler.swift) | O(26log26)<br />~O(1) | O(1) | Medium | :x: |
| 31 | [Next Permutation](./NextPermutation.swift) | O(N) | O(1) | Medium | :white_check_mark: |
| 1094   |              [Car Pooling](./CarPooling.swift)               |              O(NlogN) |  O(N) |   Medium   | :x: |
| 56 | [Merge Interval](./MergeIntervals.swift) | O(NlogN) | O(N) | Medium | :white_check_mark: |
| 53 | [Maximum Subarray](./MaximumSubarray.swift) | O(N) | O(1) | Medium | :white_check_mark: |
| 283 | [Move Zero](./MoveZero.swift) | O(N) | O(1) | Easy | :white_check_mark: |

## String

- Loop chars. `Array(string)`
- Loop char with index. `for (index, char)in string.enumerated() { ... }`
- Find first char in string. `string.prefix(1)`
- 

| Number | Question | Time | Space | Difficulty | Done |
| ------ | -------- | ---- | ----- | ---------- | ---- |
|        |          |      |       |            |      |

## Tree

| Number | Question   | Time  | Space | Difficulty | Done |
| ------ |:----------:| -----:|----:|:-------:| ------ |
| 270 | [Closest BST Value](./ClosestBinarySearchTreeValue.swift)| O(N) | O(1)    | Medium |  |
| 98 | [Validate BST](./ValidateBinarySearchTree.swift)| O(N) | O(1)    | Medium |  |
| 199 | [Binary Tree Right Side View](./BinaryTreeRightSideView.swift)| O(N) | O(1)    | Medium |  |
|  | |  |  |  |  |
|  | |  |  |  |  |


## Stack

| Number | Question                              | Time | Space | Difficulty | Done |
| ------ | ------------------------------------- | ---- | ----- | ---------- | ---- |
| 394    | [Decode String](./DecodeString.swift) | O(N) | O(N)  | Medium     | :x:  |
|        |                                       |      |       |            |      |
|        |                                       |      |       |            |      |

## Queue

| Number |                Question                 |                    Time | Space | Difficulty | Done |
| ------ | :-------------------------------------: | ----------------------: | ----: | :--------: | ---- |
| 621    | [Task Scheduler](./TaskScheduler.swift) | O(26log26)<br /> ~ O(1) |  O(1) |   Medium   | :x:  |



## Heap

| Number |                  Question                  |     Time | Space | Difficulty | Done               |
| ------ | :----------------------------------------: | -------: | ----: | :--------: | ------------------ |
| 56     |  [Merge Interval](./MergeIntervals.swift)  | O(NlogN) |  O(N) |   Medium   | :white_check_mark: |
| 253    | [Meeting Rooms II](./MeetingRoomsII.swift) | O(NlogN) |  O(N) |   Medium   | :x:                |
|        |                                            |          |       |            |                    |
|        |                                            |          |       |            |                    |
|        |                                            |          |       |            |                    |



## Priority-Queue

| Number |                Question                 |                    Time | Space | Difficulty | Done |
| ------ | :-------------------------------------: | ----------------------: | ----: | ---------- | ---- |
| 621    | [Task Scheduler](./TaskScheduler.swift) | O(26log26)<br /> ~ O(1) |  O(1) | Medium     | :x:  |
|        |                                         |                         |       |            |      |
|        |                                         |                         |       |            |      |
|        |                                         |                         |       |            |      |

## Depth-First-Search

| Number |                           Question                           |   Time | Space | Difficulty | Done               |
| ------ | :----------------------------------------------------------: | -----: | ----: | ---------- | ------------------ |
| 502    |         [Number of Islands](./NumberOfIslands.swift)         |  O(MN) | O(MN) | Medium     | :x:                |
| 100    |                [Same Tree](./SameTree.swift)                 |   O(N) |  O(1) | Easy       | :white_check_mark: |
| 394    |            [Decode String](./DecodeString.swift)             |   O(N) |  O(N) | Medium     | :x:                |
| 695    |        [Max Area of Island](./MaxAreaOfIsland.swift)         |  O(MN) | O(MN) | Medium     | :white_check_mark: |
| 721    |           [Accounts Merge](./AccountsMerge.swift)            |        |       |            |                    |
| 785    |        [Is Graph Bipartite](./IsGraphBipartite.swift)        | O(N+m) |  O(N) |            |                    |
| 1123   | [Common Ancestor Of Deepest Leaves](./CommonAncestorOfDeepestLeaves.swift) |   O(N) |  O(N) | Medium     | :white_check_mark: |
|        |                                                              |        |       |            |                    |
|        |                                                              |        |       |            |                    |

## Breadth-First-Search

| Number | Question | Time | Space | Difficulty | Done |
| ------ | -------- | ---- | ----- | ---------- | ---- |
|        |          |      |       |            |      |

## Greedy

| Number | Question                                                     |                    Time | Space | Difficulty | Done               |
| ------ | ------------------------------------------------------------ | ----------------------: | ----: | ---------- | ------------------ |
| 621    | [Task Scheduler](./TaskScheduler.swift)                      | O(26log26)<br /> ~ O(1) |  O(1) | Medium     | :x:                |
| 1094   | [Car Pooling](./CarPooling.swift)                            |                O(NlogN) |  O(N) | Medium     | :x:                |
| 253    | [Meeting Rooms II](./MeetingRoomsII.swift)                   |                O(NlogN) |  O(N) | Medium     | :x:                |
| 252    | Meeting Rooms                                                |                         |       |            |                    |
| 56     | [Merge Interval](./MergeIntervals.swift)                     |                O(NlogN) |  O(N) | Medium     | :white_check_mark: |
| 435    | Non-overlapping Intervals                                    |                         |       |            |                    |
| 452    | [Minimum Number of Arrows to Burst Balloons](./MinimumNumberOfArrowsToBurstBalloons.swift) |                O(NlogN) |  O(N) | Medium     | :white_check_mark: |
| 53     | [Maximum Subarray](./MaximumSubarray.swift)                  |                    O(N) |  O(1) | Medium     | :white_check_mark: |
|        | [Best Time to Buy and Sell Stock](./BestTimeToBuyAndSellStockII.swift) |                         |       |            |                    |
|        |                                                              |                         |       |            |                    |
|        |                                                              |                         |       |            |                    |
|        |                                                              |                         |       |            |                    |
|        |                                                              |                         |       |            |                    |
|        |                                                              |                         |       |            |                    |

## Sorting

| Number | Question                                       | Time     | Space | Difficulty | Done               |
| ------ | ---------------------------------------------- | -------- | ----- | ---------- | ------------------ |
| 88     | [Merge Sorted Array](./MergeSortedArray.swift) | O(N)     | O(1)  | Easy       | :white_check_mark: |
| 56     | [Merge Interval](./MergeIntervals.swift)       | O(NlogN) | O(N)  | Medium     | :white_check_mark: |
| 253    | [Meeting Rooms II](./MeetingRooms.swift)       | O(NlogN) | O(N)  | Medium     | :x:                |
|        |                                                |          |       |            |                    |
|        |                                                |          |       |            |                    |

## Dynamic Programming

| Number | Question | Time | Space | Difficulty | Done |
| ------ | -------- | ---- | ----- | ---------- | ---- |
|        |          |      |       |            |      |

## Graph

| Number | Question   | Time  | Space | Difficulty | Algor |
| ------ |:----------:| -----:|----:|---------| ------ |
| 270 | [Accounts Merge](./AccountsMerge.swift)| O(AlogA) | O(A)    | Medium | Union-Find |
| 305 | [Number of Island II](./NumberOfIslandII.swift) |  |  | Hard | Union-Find |
|  | |  |  |  |  |
|  | |  |  |  |  |
|  | |  |  |  |  |

## Bit Manipulation 

Now let's discuss \mathcal{O}(1)O(1) space solution by using three [bitwise operators](https://wiki.python.org/moin/BitwiseOperators)

∼x	bitwise NOT

*x*&y bitwise AND

*x*⊕y  bitwise XOR

| Number |                  Question                  | Time | Space | Difficulty | Done               |
| ------ | :----------------------------------------: | ---: | ----: | ---------- | ------------------ |
| 136    |   [Single Number](./SingleNumber.swift)    | O(N) |  O(1) | Easy       | :white_check_mark: |
| 137    | [Single Number II](./SingleNumberII.swift) | O(N) |  O(1) | Medium     | :white_check_mark: |
| 260    | [Single Number III](./SingleNumber.swift)  |      |       |            |                    |
|        |                                            |      |       |            |                    |
|        |                                            |      |       |            |                    |

## Set

`contains`

`insert`

`remove`

`isSubset(of:) `

`intersection()`

| Number |               Question                | Time | Space | Difficulty | Done               |
| ------ | :-----------------------------------: | ---: | ----: | ---------- | ------------------ |
| 136    | [Single Number](./SingleNumber.swift) | O(N) |  O(1) | Easy       | :white_check_mark: |




