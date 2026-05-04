# 0417. Pacific Atlantic Water Flow

- 難度：Medium
- LeetCode：https://leetcode.com/problems/pacific-atlantic-water-flow/

## 題目描述（中文）

m×n 高度地圖，左上鄰接太平洋、右下鄰接大西洋。水可從高處流向相同或更低高度的相鄰格。求所有「兩洋皆可流到」的座標 `[i,j]`。

## 範例 / 限制

- 1 ≤ m, n ≤ 200。

## 解法

### 解法（從邊界反向 DFS）

從太平洋邊界 (上、左) 反向 dfs：能流到此處→標 pac。再從大西洋邊界 (下、右) dfs→標 atl。兩者皆 true 的座標即答案。

時間 O(m·n)，空間 O(m·n)。

## 關鍵點 / 易錯陷阱

- 反向走是因「水往下流」反過來變成「水從邊界往高處走」，遞迴條件改為「鄰格高度 ≥ 當前」。
