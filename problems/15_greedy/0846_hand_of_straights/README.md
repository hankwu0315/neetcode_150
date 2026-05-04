# 0846. Hand of Straights

- 難度：Medium
- LeetCode：https://leetcode.com/problems/hand-of-straights/

## 解法

計數後，由最小值開始嘗試湊出 k 連續，連續扣減；不夠則失敗。可用 SortedDict 或排序後跳過 0 計數。
