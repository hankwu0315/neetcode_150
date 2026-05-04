# 0269. Alien Dictionary

- 難度：Hard
- LeetCode：https://leetcode.com/problems/alien-dictionary/

## 題目描述（中文）

外星字典依字母序給出已排序的單字串列 `words`。推導出字母順序（同樣 a-z 字母範圍但順序未知）；若無解回 `""`，多解任一即可。

## 範例 / 限制

- `["wrt","wrf","er","ett","rftt"]` → `"wertf"`

## 解法

### 解法（拓撲排序）

逐對相鄰單字找第一個不同字母，建邊 `a -> b`。若前綴包含後者卻較長則無效（例 `["abc","ab"]`）。
對所有出現過的字母做 Kahn 拓撲；存在環則回 `""`。

時間 O(C)，C = 所有字母總長。

## 關鍵點 / 易錯陷阱

- 邊集合需去重（用 set 防止入度誤算）。
- 處理不合法前綴：直接 return ""。
