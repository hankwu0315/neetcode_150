# 0019. Remove Nth Node From End of List

- 難度：Medium
- LeetCode：https://leetcode.com/problems/remove-nth-node-from-end-of-list/

## 題目描述（中文）

刪除單向串列倒數第 `n` 個節點，回傳新頭。要求只用一次掃描。

## 範例 / 限制

- `[1,2,3,4,5], n=2` → `[1,2,3,5]`
- `[1], n=1` → `[]`
- `[1,2], n=1` → `[1]`

## 解法

### 解法 1：dummy + 雙指標一次掃描（最佳解）

1. `dummy -> head`，`fast = slow = dummy`。
2. `fast` 先走 `n + 1` 步。
3. `fast` 與 `slow` 同步前進直到 `fast` 為 `None`。
4. 此時 `slow.next` 即倒數第 n 個 → `slow.next = slow.next.next`。

- 時間：O(L)
- 空間：O(1)

### 解法 2：兩次掃描

第一次算長度 `L`，第二次走到 `L - n`，刪除其 `next`。
- 時間：O(L)
- 空間：O(1)

## 範例追蹤

`[1,2,3,4,5], n=2`：
- fast 走 3 步到 3。
- 同步走：fast→4 slow→1；fast→5 slow→2；fast→null slow→3。
- `slow.next = slow.next.next` → 跳過 4，得 `[1,2,3,5]` ✓

## 關鍵點 / 易錯陷阱

- 必須使用 **dummy**，否則刪除頭節點時要特判。
- `fast` 先走 `n + 1` 步是為了讓 slow 停在「待刪節點的前一個」。
- n 保證合法（1 ≤ n ≤ L），無需處理越界。
