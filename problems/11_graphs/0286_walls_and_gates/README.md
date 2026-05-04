# 0286. Walls and Gates

- 難度：Medium
- LeetCode：https://leetcode.com/problems/walls-and-gates/

## 題目描述（中文）

`-1`=牆、`0`=門、`INF=2147483647`=空房間。把每個空房間改為到最近門的距離。

## 範例 / 限制

- 詳見 LeetCode 例。

## 解法

### 解法（多源 BFS）

從所有 `0` 出發 BFS，距離逐層 +1，第一次到達 INF 房間即為答案。

時間 O(m·n)，空間 O(m·n)。

## 關鍵點 / 易錯陷阱

- 多源 BFS 比每個房間單獨 BFS 高效（O(m·n) vs O((m·n)^2)）。
- 用「先檢查是否 INF 再更新」避免覆蓋更短距離。
