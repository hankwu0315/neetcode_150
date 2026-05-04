# 0295. Find Median from Data Stream

- 難度：Hard
- LeetCode：https://leetcode.com/problems/find-median-from-data-stream/

## 題目描述（中文）

設計資料結構支援：
- `addNum(num)`：加入整數
- `findMedian()`：回傳目前中位數（雙數時為中央兩數均值）

## 範例 / 限制

- `add 1, 2, find→1.5, add 3, find→2`

## 解法

### 解法（最佳解）：兩個 heap

- `lo`：max-heap 存較小一半。
- `hi`：min-heap 存較大一半。
- 不變量：`len(lo) == len(hi)` 或 `len(lo) == len(hi)+1`。
- `addNum`：先 push 進 lo（取負）；把 lo 的 top 移到 hi；若 hi 比 lo 多，把 hi 的 top 移回 lo。
- `findMedian`：奇數時是 lo 的 top；偶數時是 (lo.top + hi.top)/2。

複雜度：
- `addNum` O(log n)
- `findMedian` O(1)

## 關鍵點 / 易錯陷阱

- 兩 heap 大小要平衡到差距 ≤ 1。
- 浮點除以 2 而不是整除。
