# 1143. Longest Common Subsequence

- 難度：Medium
- LeetCode：https://leetcode.com/problems/longest-common-subsequence/

兩字串最長共同子序列長度。

## 解法

`dp[i][j] = dp[i-1][j-1]+1 if s1[i-1]==s2[j-1] else max(dp[i-1][j], dp[i][j-1])`。可滾動。
