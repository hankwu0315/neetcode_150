# 0010. Regular Expression Matching

- 難度：Hard
- LeetCode：https://leetcode.com/problems/regular-expression-matching/

支援 `.`、`*`（前一字元零或多）的整字串匹配。

## 解法

DP：`dp[i][j]` = `s[:i]` 是否匹配 `p[:j]`。
- `p[j-1]=='*'`: 0 次 `dp[i][j-2]`，或多次 `dp[i-1][j]` 且 s[i-1] 與 p[j-2] 匹配
- 否則：`dp[i-1][j-1]` 且當前匹配
