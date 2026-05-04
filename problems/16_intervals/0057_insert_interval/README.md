# 0057. Insert Interval

- 難度：Medium
- LeetCode：https://leetcode.com/problems/insert-interval/

## 解法

掃描三段：完全在 newInterval 之前直接加入；重疊則合併到 newInterval；之後直接加入。
