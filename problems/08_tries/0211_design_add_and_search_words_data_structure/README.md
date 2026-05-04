# 0211. Design Add and Search Words Data Structure

- 難度：Medium
- LeetCode：https://leetcode.com/problems/design-add-and-search-words-data-structure/

## 題目描述（中文）

實作 `WordDictionary`：
- `addWord(word)`
- `search(word)`：`word` 可能含 `.`，可匹配任一字元

## 範例 / 限制

- `add("bad"), add("dad"), add("mad")`，`search("pad")` → false；`search("bad")` → true；`search(".ad")` → true；`search("b..")` → true。
- 單字最多 25 字元，全小寫；`.` 出現不超過 3 次（在含 `.` 查詢時）。

## 解法

### 解法（最佳解）：Trie + 帶 `.` 的 DFS

`add` 與一般 Trie 相同。`search` 沿字元走；遇 `.` 時對所有 children 遞迴；其他字元一條路徑。
- 時間：`add` O(m)；`search` O(26^d × m)（d 為 `.` 個數）
- 空間：O(總字元數)

## 關鍵點 / 易錯陷阱

- `.` 必須遞迴所有子節點，但只在當前位置展開一層。
- 結束位置必須 end=true 才算 match。
