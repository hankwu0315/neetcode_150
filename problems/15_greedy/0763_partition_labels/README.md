# 0763. Partition Labels

- 難度：Medium
- LeetCode：https://leetcode.com/problems/partition-labels/

## 解法

紀錄每字母最後出現位置；遍歷時擴展當前段 `end = max(end, last[c])`，當 `i==end` 切割並紀錄長度。
