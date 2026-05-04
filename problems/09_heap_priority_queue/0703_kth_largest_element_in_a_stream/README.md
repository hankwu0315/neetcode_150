# 0703. Kth Largest Element in a Stream

- 難度：Easy
- LeetCode：https://leetcode.com/problems/kth-largest-element-in-a-stream/

## 題目描述（中文）

實作一個資料流中的第 k 大元素查詢結構：
- `KthLargest(k, nums)`：用初始陣列 nums 與整數 k 初始化。
- `add(val)`：插入 val 後回傳當前流中第 k 大的元素。

## 範例 / 限制

- `k=3, nums=[4,5,8,2]`，`add(3)→4, add(5)→5, add(10)→5, add(9)→8, add(4)→8`。

## 解法

### 解法（最佳解）：大小為 k 的最小堆

維持目前看到的「最大 k 個」於 min-heap：
- 加入 val。
- 若 heap.size > k，pop 最小者。
- 答案 = heap[0]（最小者就是第 k 大）。

複雜度：
- `add` O(log k)
- 空間 O(k)

## 關鍵點 / 易錯陷阱

- 為什麼用 min-heap 而不是 max-heap：要 O(log k) 而不是 O(n log n)；最小者即第 k 大。
- 初始化時也要「壓到 k 為止」。
