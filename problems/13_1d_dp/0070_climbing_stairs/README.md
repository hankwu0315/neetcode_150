# 0070. Climbing Stairs

- 難度：Easy
- LeetCode：https://leetcode.com/problems/climbing-stairs/

## 題目描述（中文）

爬樓梯：每次走 1 或 2 階，到達第 n 階共有幾種方法。

## 解法

費氏遞推 `dp[i]=dp[i-1]+dp[i-2]`，滾動兩變數即可。時間 O(n)，空間 O(1)。
