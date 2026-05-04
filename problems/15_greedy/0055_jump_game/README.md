# 0055. Jump Game

- 難度：Medium
- LeetCode：https://leetcode.com/problems/jump-game/

## 解法

貪心：維護目前可達最遠 `reach`；若 `i>reach` 則失敗，否則 `reach=max(reach, i+nums[i])`。
