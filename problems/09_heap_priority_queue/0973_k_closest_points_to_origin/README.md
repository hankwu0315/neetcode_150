# 0973. K Closest Points to Origin

- 難度：Medium
- LeetCode：https://leetcode.com/problems/k-closest-points-to-origin/

## 題目描述（中文）

平面上 n 個點，回傳離原點 (0,0) 距離最近的 k 個點（順序不限）。距離用平方距離 x²+y² 比較即可。

## 範例 / 限制

- `points=[[1,3],[-2,2]], k=1` → `[[-2,2]]`
- `points=[[3,3],[5,-1],[-2,4]], k=2` → `[[3,3],[-2,4]]`

## 解法

### 解法 1：排序

依 x²+y² 排序取前 k 個。
- 時間：O(n log n)，空間 O(1)~O(n)

### 解法 2（最佳解 1）：大小 k 的 max-heap

每點推入；超出 k 就 pop 最大者。剩下即最近 k 個。
- 時間：O(n log k)
- 空間：O(k)

### 解法 3：Quickselect（平均 O(n)）

依距離做 partition；省略實作。

## 關鍵點 / 易錯陷阱

- 用平方距離，避免 sqrt 與浮點誤差。
- max-heap：保留最近的 k 個（push 後若超 k 就 pop）。
