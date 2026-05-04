# 0146. LRU Cache

- 難度：Medium
- LeetCode：https://leetcode.com/problems/lru-cache/

## 題目描述（中文）

設計 LRU（最近最少使用）快取：
- `LRUCache(capacity)`：初始化容量。
- `get(key)`：存在回傳值並標記為「最近使用」；否則回 `-1`。
- `put(key, value)`：插入或更新；若超過容量，逐出最久未使用者。

`get` 與 `put` 均要求 **O(1)**。

## 範例 / 限制

```
LRUCache(2)
put(1,1); put(2,2)
get(1)    // 1
put(3,3)  // 逐出 key=2
get(2)    // -1
put(4,4)  // 逐出 key=1
get(1)    // -1
get(3)    // 3
get(4)    // 4
```

## 解法

### 解法（最佳解）：HashMap + 雙向鏈結串列

- `dict` 儲存 `key -> node`（查找 O(1)）。
- 雙向鏈結串列維護「最近使用」順序：頭為最新，尾為最舊；頭尾用 dummy 簡化邊界。
- `get`：找到節點 → 移到頭。
- `put`：存在則更新值且移到頭；不存在則新增頭；超容量則移除尾節點並從 dict 刪除其 key。

- 時間：O(1) 每操作
- 空間：O(capacity)

> Python 可直接用 `collections.OrderedDict` 簡化，但這裡示範雙鏈結原理。

## 範例追蹤

容量 2，操作如題：
| op | dict | list (head→tail) |
|---|---|---|
| put(1,1) | {1} | 1 |
| put(2,2) | {1,2} | 2,1 |
| get(1)→1 | — | 1,2 |
| put(3,3) 滿，逐出 2 | {1,3} | 3,1 |
| get(2) → -1 | — | — |

## 關鍵點 / 易錯陷阱

- **更新時也要移到頭**，否則 LRU 順序錯亂。
- 用 `head/tail` dummy 節點簡化插入/刪除邊界。
- 從 dict 刪除被逐出的 key（不是只刪鏈結）。
