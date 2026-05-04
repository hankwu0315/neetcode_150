# 0743. Network Delay Time

- 難度：Medium
- LeetCode：https://leetcode.com/problems/network-delay-time/

## 題目描述（中文）

有向加權圖，從節點 `k` 廣播信號，所有節點都收到的最短時間。`times[i]=[u,v,w]`。不可達回 -1。

## 範例 / 限制

- `times=[[2,1,1],[2,3,1],[3,4,1]], n=4, k=2` → 2

## 解法

### 解法（Dijkstra，min-heap）

由 k 出發鬆弛；最終答案是所有 dist 的最大值；若有 inf 表示不可達回 -1。

時間 O((V+E) log V)，空間 O(V+E)。

## 關鍵點 / 易錯陷阱

- 邊權為正才能用 Dijkstra；本題保證 w ≥ 0。
