# 0746. Min Cost Climbing Stairs

- 難度：Easy
- LeetCode：https://leetcode.com/problems/min-cost-climbing-stairs/

## 題目描述（中文）

`cost[i]` 為踏上第 i 階費用。可從 0 或 1 起步，每次走 1 或 2 階。求到達頂端（n）的最小總花費。

## 解法

DP：`dp[i] = min(dp[i-1]+cost[i-1], dp[i-2]+cost[i-2])`。空間 O(1)。
