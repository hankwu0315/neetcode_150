# 0131. Palindrome Partitioning

- 難度：Medium
- LeetCode：https://leetcode.com/problems/palindrome-partitioning/

## 題目描述（中文）

把字串 `s` 切成若干「每段都是回文」的子字串，回傳所有可能切法。

## 範例 / 限制

- `"aab"` → `[["a","a","b"],["aa","b"]]`
- `"a"` → `[["a"]]`

## 解法

### 解法（回溯）

dfs(start)：
- 若 start == n：收 path。
- 對 end in [start..n)：若 `s[start..end]` 是回文，加入 path → dfs(end+1) → 回溯。

時間 O(N · 2^N)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 回文檢查用雙指針線性 O(切片長度)。
