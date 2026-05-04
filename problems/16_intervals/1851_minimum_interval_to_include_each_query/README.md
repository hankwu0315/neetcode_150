# 1851. Minimum Interval to Include Each Query

- 難度：Hard
- LeetCode：https://leetcode.com/problems/minimum-interval-to-include-each-query/

## 解法

把區間按 left 排序、queries 排序處理。用最小堆 (size, end)，遇 q 把 left ≤ q 的區間入堆，彈出 end < q 的，堆頂 size 即答案。
