# 0208. Implement Trie (Prefix Tree)

- 難度：Medium
- LeetCode：https://leetcode.com/problems/implement-trie-prefix-tree/

## 題目描述（中文）

實作 Trie：
- `insert(word)`：插入單字
- `search(word)`：是否存在精確相同的單字
- `startsWith(prefix)`：是否存在以該 prefix 開頭的單字

## 範例 / 限制

- `insert("apple"); search("apple")` → `true`
- `search("app")` → `false`，`startsWith("app")` → `true`
- 單字長度 1..2000，全為小寫英文。

## 解法

### 解法（最佳解）：26 子節點 / dict 子節點 + end flag

每節點存 `children: dict[char, Node]`、`end: bool`。
- `insert`：沿字串走，缺則建立；最後 `end = true`。
- `search`：走完後檢查 `end`。
- `startsWith`：能走完即可。

複雜度（單字長 m）：
- 時間：O(m) 每操作
- 空間：O(總字元數)

## 關鍵點 / 易錯陷阱

- search 與 startsWith 差別只在於是否要求 end flag。
- 用 dict 比固定 26 陣列省空間。
