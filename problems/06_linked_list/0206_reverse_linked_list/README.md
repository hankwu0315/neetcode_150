# 0206. Reverse Linked List

- 難度：Easy
- LeetCode：https://leetcode.com/problems/reverse-linked-list/

## 題目描述（中文）

給定單向鏈結串列的頭節點 `head`，反轉串列並回傳新的頭。

## 範例 / 限制

- `1->2->3->4->5` → `5->4->3->2->1`
- `1->2` → `2->1`
- `[]` → `[]`

## 解法

### 解法 1：迭代（最佳解）

維持 `prev = None, cur = head`，每步：
```
nxt = cur.next
cur.next = prev
prev = cur
cur = nxt
```
結束後 `prev` 為新頭。
- 時間：O(n)
- 空間：O(1)

### 解法 2：遞迴

`reverse(head)`：若 `head` 或 `head.next` 為 `None` 直接回傳。否則 `newHead = reverse(head.next)`、`head.next.next = head`、`head.next = None`。
- 時間：O(n)
- 空間：O(n) 呼叫堆疊

## 範例追蹤（迭代）

`1->2->3`：
| step | prev | cur | nxt |
|---|---|---|---|
| init | None | 1 | — |
| 1 | 1 | 2 | 2 |
| 2 | 2->1 | 3 | 3 |
| 3 | 3->2->1 | None | — |

回傳 `prev = 3`。

## 關鍵點 / 易錯陷阱

- **必須先存 `nxt = cur.next`**，否則改 `cur.next` 後就找不到下一個節點。
- 遞迴版要記得 `head.next = None`，避免形成環。
