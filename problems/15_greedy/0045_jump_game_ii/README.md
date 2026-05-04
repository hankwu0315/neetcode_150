# 0045. Jump Game II

- 難度：Medium
- LeetCode：https://leetcode.com/problems/jump-game-ii/

## 解法

BFS 分層：`end` 為當前跳數可達邊界；遍歷時更新 `farthest`，到 `end` 時跳一步並更新 `end=farthest`。
