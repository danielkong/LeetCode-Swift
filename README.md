# iOS Leetcode
## Data Structures
* [Array](#array)
* [String](#string)
* [Tree](#tree)
* [Linked List](#Linked List)
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

- void `reverse()` Time complexity: O(**n**), where **n** is the number of elements.

- [Element] `reversed()` Time complexity: O(1).

- `stride(from: 3, to: 0, by: -1)` count down from 3 to 1.

- `stride(from: 3, through: 0, by: -1)` count down from 3 to 0.

  

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
|  | [Counting Elements](CountingElements.swift) | O(N) | O(1) | Easy | :white_check_mark: |
| 1046 | [Last Stone Weight](./LastStoneWeight.swift) | O(N^2) | O(N) | Easy | :white_check_mark: |
| 238 | [Product of Array Except Self](,/ProductOfArrayExceptSelf.swift) | O(N) | O(N) | Medium | :white_check_mark: |
| 1374 | [Left Most Column With One](/.leftMostColumnWithOne.swift) | O(NlogN) | O(1) | Medium | :white_check_mark: |
|  |  |  |  |  |  |
|  |  |  |  |  |  |
|  |  |  |  |  |  |
|  |  |  |  |  |  |
|  |  |  |  |  |  |
|  |  |  |  |  |  |

## String

- Loop chars. `Array(string)`

- Loop char with index. `for (index, char)in string.enumerated() { ... }`

- Find first char in string. `string.prefix(1)`

  

| Number |                          Question                          | Time      | Space | Difficulty | Done               |
| :----: | :--------------------------------------------------------: | --------- | ----- | ---------- | ------------------ |
|   49   |          [Group Anagrams](./GroupAnagrams.swift)           | O(NKlogK) | O(NK) | Medium     | :white_check_mark: |
|  249   |    [Group Shifted Strings](./GroupShiftedStrings.swift)    |           |       | Medium     |                    |
|  844   | [Backspace String Compare](./BackspaceStringCompare.swift) | O(N)      | O(1)  | Easy       | :white_check_mark: |
|  678   | [Valid Parenthesis String](./ValidParenthesisString.swift) |           |       | Medium     |                    |
|        |    [Perform String Shifts](./PerformStringShifts.swift)    | O(N)      | O(1)  | Easy       | :white_check_mark: |
|        |                                                            |           |       |            |                    |
|        |                                                            |           |       |            |                    |
|        |                                                            |           |       |            |                    |
|        |                                                            |           |       |            |                    |



## Tree

| Number | Question   | Time  | Space | Difficulty | Done |
| ------ |:----------:| -----:|----:|:-------:| ------ |
| 270 | [Closest BST Value](./ClosestBinarySearchTreeValue.swift)| O(N) | O(1)    | Medium |  |
| 98 | [Validate BST](./ValidateBinarySearchTree.swift)| O(N) | O(1)    | Medium |  |
| 199 | [Binary Tree Right Side View](./BinaryTreeRightSideView.swift)| O(N) | O(1)    | Medium |  |
| 1008 | [Construct Binary Search Tree from Preorder Traversal](./ConstructBinarySearchTreeFromPreorderTraversal.swift) | O(N) | O(N) | Medium | :white_check_mark: |
|  | |  |  |  |  |



## Linked List



| Number |                          Question                          | Time | Space | Difficulty | Done               |
| ------ | :--------------------------------------------------------: | ---- | ----- | ---------- | ------------------ |
| 876    | [Middle Of The Linked List](./MiddleOfTheLinkedList.swift) | O(N) | O(1)  | Easy       | :white_check_mark: |
|        |                                                            |      |       |            |                    |
|        |                                                            |      |       |            |                    |

## Stack

| Number |               Question                | Time | Space | Difficulty | Done |
| ------ | :-----------------------------------: | ---- | ----- | ---------- | ---- |
| 394    | [Decode String](./DecodeString.swift) | O(N) | O(N)  | Medium     | :x:  |
|        |                                       |      |       |            |      |
|        |                                       |      |       |            |      |

## Queue

| Number |                Question                 |                    Time | Space | Difficulty | Done |
| ------ | :-------------------------------------: | ----------------------: | ----: | :--------: | ---- |
| 621    | [Task Scheduler](./TaskScheduler.swift) | O(26log26)<br /> ~ O(1) |  O(1) |   Medium   | :x:  |



## Heap

| Number |                   Question                   |     Time | Space | Difficulty | Done               |
| ------ | :------------------------------------------: | -------: | ----: | :--------: | ------------------ |
| 56     |   [Merge Interval](./MergeIntervals.swift)   | O(NlogN) |  O(N) |   Medium   | :white_check_mark: |
| 253    |  [Meeting Rooms II](./MeetingRoomsII.swift)  | O(NlogN) |  O(N) |   Medium   | :x:                |
| 1046   | [Last Stone Weight](./LastStoneWeight.swift) |   O(N^2) |  O(N) |    Easy    | :white_check_mark: |
|        |                                              |          |       |            |                    |
|        |                                              |          |       |            |                    |



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
| 1236   |              [Web Crawler](./WebCrawler.swift)               |   O(N) |  O(N) | Medium     | :white_check_mark: |
| 968    |       [Binary Tree Cameras](./BinaryTreeCameras.swift)       |   O(N) |  O(N) | Hard       | :x:                |
| 494    |               [Target Sum](./TargetSum.swift)                |   O(N) |  O(N) | Medium     | :white_check_mark: |
|        |                                                              |        |       |            |                    |
|        |                                                              |        |       |            |                    |
|        |                                                              |        |       |            |                    |
|        |                                                              |        |       |            |                    |

## Breadth-First-Search

| Number | Question                                   | Time  | Space                 | Difficulty | Done |
| ------ | ------------------------------------------ | ----- | --------------------- | ---------- | ---- |
| 64     | [Minimum Path Sum](./MinimumPathSum.swift) | O(MN) | O(M) <br />Best: O(1) | Medium     | :x:  |

## Greedy

| Number |                           Question                           |                    Time | Space | Difficulty | Done               |
| ------ | :----------------------------------------------------------: | ----------------------: | ----: | ---------- | ------------------ |
| 621    |           [Task Scheduler](./TaskScheduler.swift)            | O(26log26)<br /> ~ O(1) |  O(1) | Medium     | :x:                |
| 1094   |              [Car Pooling](./CarPooling.swift)               |                O(NlogN) |  O(N) | Medium     | :x:                |
| 253    |          [Meeting Rooms II](./MeetingRoomsII.swift)          |                O(NlogN) |  O(N) | Medium     | :x:                |
| 252    |                        Meeting Rooms                         |                         |       |            |                    |
| 56     |           [Merge Interval](./MergeIntervals.swift)           |                O(NlogN) |  O(N) | Medium     | :white_check_mark: |
| 435    |                  Non-overlapping Intervals                   |                         |       |            |                    |
| 452    | [Minimum Number of Arrows to Burst Balloons](./MinimumNumberOfArrowsToBurstBalloons.swift) |                O(NlogN) |  O(N) | Medium     | :white_check_mark: |
| 53     |         [Maximum Subarray](./MaximumSubarray.swift)          |                    O(N) |  O(1) | Medium     | :white_check_mark: |
| 122    | [Best Time to Buy and Sell Stock](./BestTimeToBuyAndSellStockII.swift) |                    O(N) |  O(1) | Easy       | :white_check_mark: |
| 678    |  [Valid Parenthesis String](./ValidParenthesisString.swift)  |                    O(N) |  O(1) | Medium     | :white_check_mark: |
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

| Number |                  Question                  | Time  | Space                 | Difficulty | Done |
| ------ | :----------------------------------------: | ----- | --------------------- | ---------- | ---- |
| 494    |      [Target Sum](./TargetSum.swift)       | O(N)  | O(N)                  | Medium     | :x:  |
| 64     | [Minimum Path Sum](./MinimumPathSum.swift) | O(MN) | O(M) <br />Best: O(1) | Medium     | :x:  |
|        |                                            |       |                       |            |      |
|        |                                            |       |                       |            |      |
|        |                                            |       |                       |            |      |
|        |                                            |       |                       |            |      |

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




