# 0494. Target Sum

- 難度：Medium
- LeetCode：https://leetcode.com/problems/target-sum/

每個數加 + 或 -，使總和為 target 的方法數。

## 解法

設正集合 P、負集合 N。`P-N=target`，`P+N=S`，得 `P=(S+target)/2`。轉成 0/1 背包計數：求子集和 = P 的方法數。
