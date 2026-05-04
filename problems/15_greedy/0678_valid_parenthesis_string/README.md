# 0678. Valid Parenthesis String

- 難度：Medium
- LeetCode：https://leetcode.com/problems/valid-parenthesis-string/

## 解法

維護左括號可能下界 `lo` / 上界 `hi`：`(`→ `lo++,hi++`，`)`→`lo--,hi--`，`*`→`lo--,hi++`。`hi<0` 失敗，`lo<0` 截為 0。終時 `lo==0`。
