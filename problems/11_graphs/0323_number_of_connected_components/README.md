# 0323. Number of Connected Components in an Undirected Graph

- 難度：Medium
- LeetCode：https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/

## 題目描述（中文）

n 個節點 (0..n-1)、邊陣列 `edges`，回傳連通分量數。

## 範例 / 限制

- `n=5, [[0,1],[1,2],[3,4]]` → 2

## 解法

### 解法（Union-Find）

初始 n 個分量；每次成功 union 兩個不同根 → 分量 -1。

時間 ~O((n+m)·α(n))，空間 O(n)。

## 關鍵點 / 易錯陷阱

- 同根時不要遞減；否則重複邊會誤算。
