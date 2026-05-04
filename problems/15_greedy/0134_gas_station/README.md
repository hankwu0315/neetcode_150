# 0134. Gas Station

- 難度：Medium
- LeetCode：https://leetcode.com/problems/gas-station/

## 解法

若 `sum(gas) < sum(cost)` 必無解。否則貪心：累積 tank，若 < 0 則起點重置為下一站，最後起點即答案。
