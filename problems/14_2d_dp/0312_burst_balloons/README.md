# 0312. Burst Balloons

- 難度：Hard
- LeetCode：https://leetcode.com/problems/burst-balloons/

戳氣球，戳第 i 顆得 `nums[l]*nums[i]*nums[r]`（l/r 為當前左右鄰居）。求最大金幣。

## 解法

兩端補 1。`dp[l][r]` 表開區間 (l,r) 內全戳完最大金幣。枚舉「最後戳的氣球 k」：
`dp[l][r] = max(dp[l][k] + dp[k][r] + a[l]*a[k]*a[r])`，l<k<r。
按長度從小到大列舉。O(n³)。
