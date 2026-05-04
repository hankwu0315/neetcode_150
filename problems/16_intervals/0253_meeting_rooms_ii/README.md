# 0253. Meeting Rooms II

- 難度：Medium
- LeetCode：https://leetcode.com/problems/meeting-rooms-ii/

## 解法

掃描線：分別排序 starts/ends，雙指標模擬，遇 start < ends[j] 則 rooms+1，否則 j++。
