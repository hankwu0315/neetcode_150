# 0017. Letter Combinations of a Phone Number

- 難度：Medium
- LeetCode：https://leetcode.com/problems/letter-combinations-of-a-phone-number/

## 題目描述（中文）

給數字字串 `digits`（含 2-9），回傳所有可能的字母組合（手機按鍵對應）。

## 範例 / 限制

- `"23"` → `["ad","ae","af","bd","be","bf","cd","ce","cf"]`
- `""` → `[]`

## 解法

### 解法（回溯）

對每個 digit 取其字母字串，dfs 逐位拼接。

時間 O(3^N · 4^M)（N 三鍵字母位數，M 四鍵字母位數），空間 O(N+M)。

## 關鍵點 / 易錯陷阱

- 空字串要回傳 `[]`，不是 `[""]`。
