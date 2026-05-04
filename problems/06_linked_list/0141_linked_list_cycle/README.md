# 0141. Linked List Cycle

- 難度：Easy
- LeetCode：https://leetcode.com/problems/linked-list-cycle/

## 題目描述（中文）

判斷單向鏈結串列中是否存在環。要求 O(1) 額外空間。

## 範例 / 限制

- `[3,2,0,-4], pos=1`（尾連到 idx 1）→ `true`
- `[1], pos=-1` → `false`

## 解法

### 解法 1：HashSet 記錄已造訪節點

走訪每個節點，存入集合；若再次遇到已存在的節點則有環。
- 時間：O(n)
- 空間：O(n)

### 解法 2：Floyd 快慢指標（最佳解）

`slow` 走 1 步、`fast` 走 2 步。若有環兩者最終相遇；若 `fast` 走到 `null` 則無環。
- 時間：O(n)
- 空間：O(1)

## 範例追蹤（解法 2）

`3->2->0->-4->2(環)`：slow 與 fast 在某輪相遇 → `true`。
`1`（無 next）：fast 立刻為 None → `false`。

## 關鍵點 / 易錯陷阱

- 必須在迴圈內檢查 `fast` 與 `fast.next` 都不為 None，否則 NPE。
- 兩指標相遇 ⇒ 必有環（鴿籠原理）。
