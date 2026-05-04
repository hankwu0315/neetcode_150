# 0138. Copy List with Random Pointer

- 難度：Medium
- LeetCode：https://leetcode.com/problems/copy-list-with-random-pointer/

## 題目描述（中文）

每個節點有 `val`、`next`、`random`（指向串列任一節點或 null）。請深拷貝此串列。

## 範例 / 限制

- `[[7,null],[13,0],[11,4],[10,2],[1,0]]` 表示：節點值依序為 7,13,11,10,1，random 分別指向索引 null,0,4,2,0。

## 解法

### 解法 1：HashMap 兩遍掃描（最佳解之一）

1. 第一遍：建立 `old -> new` 對應，只複製 val。
2. 第二遍：用 map 設定每個 new 的 `next` 與 `random`。
- 時間：O(n)
- 空間：O(n)

### 解法 2：原串列穿插 + 拆分（O(1) 額外空間）

1. 把每個複製節點插在原節點後面：`A->A'->B->B'->...`
2. 設定 random：`A'.random = A.random.next`（若 A.random 不為 null）。
3. 拆分回兩串列。
- 時間：O(n)
- 空間：O(1)（不計輸出）

## 範例追蹤（解法 1）

第一遍建出新節點同值的串列，並把 `old->new` 記到 dict。
第二遍逐節點查 dict，把 `new.next = dict[old.next]`、`new.random = dict[old.random]`。

## 關鍵點 / 易錯陷阱

- `random` 可能為 null，需特判 `dict[None] = None` 或先檢查。
- 解法 2 拆分時要分別維護兩串列尾，避免破壞原 random 指向。
