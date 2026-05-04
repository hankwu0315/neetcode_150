# 0130. Surrounded Regions

- 難度：Medium
- LeetCode：https://leetcode.com/problems/surrounded-regions/

## 題目描述（中文）

m×n 棋盤含 `'X'` 與 `'O'`。把所有「**完全被 X 圍住**」的 `O` 區域翻成 `X`。連到邊界的 `O` 不翻。

## 範例 / 限制

- 詳見 LeetCode。

## 解法

### 解法（從邊界 DFS 標記）

1. 對所有邊界上的 `'O'` 開 dfs，把連通的 O 都暫時標為 `'#'`。
2. 第二次掃描：`'O'` → `'X'`，`'#'` → `'O'`。

時間 O(m·n)，空間 O(m·n)。

## 關鍵點 / 易錯陷阱

- 不能直接從內部 O 出發判斷，因為要看是否「碰到邊界」。從邊界反向標記乾淨。
