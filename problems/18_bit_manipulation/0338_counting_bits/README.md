# 0338. Counting Bits

- 難度：Easy
- LeetCode：https://leetcode.com/problems/counting-bits/

## 解法

`dp[i] = dp[i >> 1] + (i & 1)`。
