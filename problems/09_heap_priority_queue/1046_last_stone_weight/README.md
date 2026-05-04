# 1046. Last Stone Weight

- 難度：Easy
- LeetCode：https://leetcode.com/problems/last-stone-weight/

## 題目描述（中文）

每次取兩個最大石頭 x ≥ y：若相等都消失，否則剩 x-y。重複至剩 ≤1 顆，回傳剩餘重量（無剩回 0）。

## 範例 / 限制

- `[2,7,4,1,8,1]` → `1`
- `[1]` → `1`

## 解法

### 解法（最佳解）：max-heap

每次 pop 兩個最大；若不等，push 差值。
- 時間：O(n log n)
- 空間：O(n)

Python 用 `heapq` 取負值模擬 max-heap。

## 關鍵點 / 易錯陷阱

- 邊界：堆為空回 0；只剩一顆回該值。
- pop 順序：第一個 pop 是 x（較大），第二個是 y。
