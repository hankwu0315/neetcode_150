# 0518. Coin Change II

- 難度：Medium
- LeetCode：https://leetcode.com/problems/coin-change-ii/

硬幣無限，求湊出 amount 的「組合數」。

## 解法

完全背包計數：外層 coin、內層 amount 升序，避免重複組合。`dp[a] += dp[a-c]`。
