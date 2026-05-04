# 0300. Longest Increasing Subsequence

- 難度：Medium
- LeetCode：https://leetcode.com/problems/longest-increasing-subsequence/

## 題目描述（中文）

最長嚴格遞增子序列長度。

## 解法（patience sorting + 二分）

`tails[k]` 為長度 k+1 的 LIS 中最小尾巴值，逐元素 lower_bound 替換或追加。O(n log n)。
