# 0062. Unique Paths

- 難度：Medium
- LeetCode：https://leetcode.com/problems/unique-paths/

從左上到右下只能往右或下，路徑數。

## 解法

組合數 C(m+n-2, m-1)，或滾動 1D DP `dp[j] += dp[j-1]`。
