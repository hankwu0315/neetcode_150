# 0198. House Robber

- 難度：Medium
- LeetCode：https://leetcode.com/problems/house-robber/

## 題目描述（中文）

不能搶相鄰的房子，求可搶到的最大金額。

## 解法

`dp[i] = max(dp[i-1], dp[i-2] + nums[i])`。滾動兩變數。O(n)/O(1)。
