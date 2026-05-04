# 0309. Best Time to Buy and Sell Stock with Cooldown

- 難度：Medium
- LeetCode：https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/

賣後一天 cooldown，求最大利潤。

## 解法

狀態：`hold`（持股）/ `sold`（剛賣，cooldown 中）/ `rest`（空倉）。
- `hold = max(hold, rest - p)`
- `sold = hold + p`
- `rest = max(rest, sold)`
更新次序需基於上一輪值。
