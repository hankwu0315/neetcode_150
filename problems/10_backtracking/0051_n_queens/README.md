# 0051. N-Queens

- 難度：Hard
- LeetCode：https://leetcode.com/problems/n-queens/

## 題目描述（中文）

n 個皇后放在 n×n 棋盤上，使任二者不同行/列/對角線。回傳所有解（每個解為長度 n 的字串陣列，"Q"=皇后，"."=空）。

## 範例 / 限制

- `n=4` → 2 個解
- `n=1` → `[["Q"]]`
- 1 ≤ n ≤ 9。

## 解法

### 解法（回溯 + 三組 set）

按 row 0..n-1 逐行擺放，當前列 c：
- `c not in cols and (r-c) not in diag1 and (r+c) not in diag2`

每行嘗試所有列。

時間 O(N!)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 兩條對角線判斷：主對角 `r-c` 不變、副對角 `r+c` 不變。
- 輸出每行字串：列 c 為 'Q'，其餘 '.'。
