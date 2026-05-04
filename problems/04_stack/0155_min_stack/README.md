# 0155. Min Stack

- 難度：Medium
- LeetCode：https://leetcode.com/problems/min-stack/

## 題目描述（中文）

設計一個堆疊類別 `MinStack`，支援以下四個操作，**全部 O(1)**：
- `push(val)`：將 `val` 推入。
- `pop()`：彈出堆疊頂端。
- `top()`：取得頂端元素。
- `getMin()`：取得當前堆疊內的最小值。

## 範例 / 限制

```
push(-2); push(0); push(-3);
getMin(); // -3
pop();
top();    // 0
getMin(); // -2
```

- pop / top / getMin 一定在堆疊非空時呼叫。

## 解法

### 解法 1：兩個堆疊 — 最佳解（推薦）

使用主堆疊 `stack` 與輔助堆疊 `min_stack`。
- `push(v)`：`stack.push(v)`；若 `min_stack` 為空或 `v <= min_stack[-1]`，亦推入 `min_stack`。
- `pop()`：若彈出值等於 `min_stack[-1]`，亦從 `min_stack` 彈出。
- `top()`：回傳 `stack[-1]`。
- `getMin()`：回傳 `min_stack[-1]`。

關鍵：`min_stack` 只在「比目前最小值還小或相等」時才推入，故重複最小值能正確處理。

- 時間：每個操作 O(1)
- 空間：O(n)

### 解法 2：每個元素存 (val, currentMin)

主堆疊每筆存一個 tuple `(val, min_so_far)`：
- `push(v)`：`new_min = min(v, top.min) if not empty else v`；推入 `(v, new_min)`。
- `getMin()`：回傳頂端 tuple 的 `min`。

- 時間：每個操作 O(1)
- 空間：O(n)（每筆都存兩個值）

## 範例追蹤（解法 1）

push -2, 0, -3：
```
stack:     [-2, 0, -3]
min_stack: [-2, -3]   # 0 不小於等於 -2，不存入
```
`getMin()` → -3 ✓
`pop()` → 彈出 -3，min_stack 同步彈出 -3 → `[-2]`
`top()` → 0
`getMin()` → -2 ✓

## 關鍵點 / 易錯陷阱

- `min_stack` 必須使用 **`<=`** 而非 `<`，否則重複最小值在 pop 後會錯。
- pop 同步條件需判斷彈出值與 `min_stack[-1]` 是否相等。
- 不可用 `min(stack)` 實作 `getMin`（O(n)）。
