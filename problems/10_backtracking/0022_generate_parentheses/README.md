# 0022. Generate Parentheses

- 難度：Medium
- LeetCode：https://leetcode.com/problems/generate-parentheses/

## 題目描述（中文）

給 `n` 對括號，列出所有合法（well-formed）的括號組合字串。

## 範例 / 限制

- `n=3` → `["((()))","(()())","(())()","()(())","()()()"]`
- 1 ≤ n ≤ 8。

## 解法

### 解法（回溯）

維護目前已用 `open`、`close` 數：
- 若 `open < n`：加 `(`。
- 若 `close < open`：加 `)`。
- 長度 == 2n：收結果。

時間 O(Catalan(n)·n)，空間 O(n)。

## 關鍵點 / 易錯陷阱

- 不變量 `close ≤ open ≤ n`。
