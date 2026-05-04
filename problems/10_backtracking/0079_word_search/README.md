# 0079. Word Search

- 難度：Medium
- LeetCode：https://leetcode.com/problems/word-search/

## 題目描述（中文）

m×n 字母網格 `board` 與單字 `word`。判斷能否在網格中由相鄰（上下左右）格子拼出 `word`，每個格子最多用一次。

## 範例 / 限制

- `board=[ABCE/SFCS/ADEE], "ABCCED"` → true
- `board=[...], "ABCB"` → false（B 不能重複用同格）

## 解法

### 解法（回溯 + 標記）

對每個 (i,j) 從 word[0] 開始 dfs：
- 若 board[i][j] != word[k]：return false
- 暫存 → 設為 '#' → 四方向遞迴（k+1）→ 還原

時間 O(m·n·4^L)，空間 O(L)（L=len(word)）。

## 關鍵點 / 易錯陷阱

- 用「原地塗銷」可省 visited 陣列：DFS 結束記得還原。
