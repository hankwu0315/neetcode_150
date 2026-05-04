# 0416. Partition Equal Subset Sum

- 難度：Medium
- LeetCode：https://leetcode.com/problems/partition-equal-subset-sum/

## 題目描述（中文）

是否可將陣列分成兩組總和相等。

## 解法

子集和為 `S/2`：0/1 背包布林 DP，使用 bitset / 反向迴圈。O(n·S)。
