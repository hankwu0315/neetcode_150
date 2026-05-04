# 0072. Edit Distance

- 難度：Medium
- LeetCode：https://leetcode.com/problems/edit-distance/

求 word1 變 word2 的最少編輯次數（插入/刪除/替換）。

## 解法

經典 Levenshtein DP。`dp[i][j]`，初始 `dp[i][0]=i, dp[0][j]=j`。轉移：
- 同字：`dp[i-1][j-1]`
- 否則：`1 + min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])`
