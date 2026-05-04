# 0215. Kth Largest Element in an Array

- 難度：Medium
- LeetCode：https://leetcode.com/problems/kth-largest-element-in-an-array/

## 題目描述（中文）

回傳陣列中第 k 大（不去重）的元素。

## 範例 / 限制

- `[3,2,1,5,6,4], k=2` → `5`
- `[3,2,3,1,2,4,5,5,6], k=4` → `4`

## 解法

### 解法 1：排序

時間 O(n log n)。

### 解法 2（最佳解 1）：大小 k 的 min-heap

維持「目前看到的最大 k 個」。最後 heap[0] 即第 k 大。
- 時間：O(n log k)
- 空間：O(k)

### 解法 3（最佳解 2）：Quickselect

對「第 (n-k) 小」做 partition，平均 O(n)、worst O(n²)。

## 關鍵點 / 易錯陷阱

- 「第 k 大」在含重複元素的定義即排序後 `nums_sorted[n-k]`。
- 為避免 worst case，可隨機選 pivot 或使用 introselect。
