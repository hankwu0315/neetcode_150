# 0115. Distinct Subsequences

- 難度：Hard
- LeetCode：https://leetcode.com/problems/distinct-subsequences/

`s` 的子序列中等於 `t` 的數量。

## 解法

`dp[i][j]` = `s[:i]` 中出現 `t[:j]` 的次數。
- 若 `s[i-1]==t[j-1]`：`dp[i-1][j-1] + dp[i-1][j]`
- 否則：`dp[i-1][j]`
可滾動為 1D（從右到左）。
