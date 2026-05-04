# 0435. Non-overlapping Intervals

- 難度：Medium
- LeetCode：https://leetcode.com/problems/non-overlapping-intervals/

## 解法

按結束時間排序，貪心保留最早結束者；衝突 +1 移除。
