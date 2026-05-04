# 0133. Clone Graph

- 難度：Medium
- LeetCode：https://leetcode.com/problems/clone-graph/

## 題目描述（中文）

給連通無向圖一個節點 `node`（含 `val` 與 `neighbors`），回傳此圖的深拷貝。

## 範例 / 限制

- 節點數 1..100；val 1..100。

## 解法

### 解法（DFS + Hash 對照表）

`mp[old]=new`。dfs(old)：若已存在直接回；否則建新、寫表、遍歷 old.neighbors 遞迴掛上。
時間 O(V+E)，空間 O(V)。

## 關鍵點 / 易錯陷阱

- 一定要先寫表再遞迴 neighbors，避免循環無限遞迴。
