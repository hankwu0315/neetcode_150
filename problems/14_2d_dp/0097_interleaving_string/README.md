# 0097. Interleaving String

- 難度：Medium
- LeetCode：https://leetcode.com/problems/interleaving-string/

`s3` 是否由 `s1`、`s2` 交錯組成。

## 解法

DP：`dp[i][j]` 表 `s1[:i] + s2[:j]` 可拼成 `s3[:i+j]`。轉移：
- `dp[i][j] |= dp[i-1][j] && s1[i-1]==s3[i+j-1]`
- `dp[i][j] |= dp[i][j-1] && s2[j-1]==s3[i+j-1]`
