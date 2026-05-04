# 0152. Maximum Product Subarray

- 難度：Medium
- LeetCode：https://leetcode.com/problems/maximum-product-subarray/

## 題目描述（中文）

連續子陣列乘積最大值。

## 解法

維護當前最大、最小（負乘負為正）：每步 `(maxP, minP) = (max(x, x*maxP, x*minP), min(...))`。
