# 0322. Coin Change

- 難度：Medium
- LeetCode：https://leetcode.com/problems/coin-change/

## 題目描述（中文）

硬幣 `coins`（無限），求湊出 `amount` 所需最少硬幣數，無法則 -1。

## 解法

完全背包 DP：`dp[a] = min(dp[a-c]+1)`。O(amount·|coins|)。
