# 0040. Combination Sum II

- 難度：Medium
- LeetCode：https://leetcode.com/problems/combination-sum-ii/

## 題目描述（中文）

給整數陣列 `candidates`（**可重複**）與 `target`，求所有「**每個元素只能用一次**」且和為 target 的不同組合。結果不可有重複組合。

## 範例 / 限制

- `[10,1,2,7,6,1,5], 8` → `[[1,1,6],[1,2,5],[1,7],[2,6]]`
- `[2,5,2,1,2], 5` → `[[1,2,2],[5]]`

## 解法

### 解法（回溯 + 排序去重）

排序後 dfs(i, remain)：
- `for j in [i..n)`：若 `j > i and c[j] == c[j-1]`：跳過（同層去重）。
- 選 j → `dfs(j+1, remain - c[j])`。
- 若 `c[j] > remain`：break。

時間最差 O(2^N)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 「同層去重」：條件是 `j > i`（不是 `j > 0`）；保留每層第一次出現該值。
- 下一層用 `j+1`（不可重複用同一個 index）。
