# 0695. Max Area of Island

- 難度：Medium
- LeetCode：https://leetcode.com/problems/max-area-of-island/

## 題目描述（中文）

m×n 網格中 `1` 為陸地，求最大連通島嶼的面積（4-連通）。沒有島回 0。

## 範例 / 限制

- 給定示例（同 LeetCode）→ 6

## 解法

### 解法（DFS）

對每個未訪問的 `1` 開 dfs，回傳整片大小，更新最大值。
時間 O(m·n)，空間 O(m·n)。

## 關鍵點 / 易錯陷阱

- DFS 回傳 `1 + sum(四方向)`，邊界與 `0` 視為 0。
