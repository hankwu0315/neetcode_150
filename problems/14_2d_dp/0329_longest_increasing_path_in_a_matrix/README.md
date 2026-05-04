# 0329. Longest Increasing Path in a Matrix

- 難度：Hard
- LeetCode：https://leetcode.com/problems/longest-increasing-path-in-a-matrix/

矩陣中嚴格遞增最長路徑長度。

## 解法

DFS + memo：每格 dfs 取四方向中嚴格更大者的 max+1。
