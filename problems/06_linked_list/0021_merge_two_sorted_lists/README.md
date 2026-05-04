# 0021. Merge Two Sorted Lists

- 難度：Easy
- LeetCode：https://leetcode.com/problems/merge-two-sorted-lists/

## 題目描述（中文）

合併兩個升序鏈結串列為一個升序串列；以接合節點方式回傳新頭。

## 範例 / 限制

- `[1,2,4], [1,3,4]` → `[1,1,2,3,4,4]`
- `[], []` → `[]`
- `[], [0]` → `[0]`

## 解法

### 解法 1：dummy + 雙指標（最佳解）

建立 `dummy`，比較兩串列當前節點，把較小者接到 `tail`，前進對應指標。最後將剩餘那串直接接上。
- 時間：O(m + n)
- 空間：O(1)

### 解法 2：遞迴

```
merge(a, b) =
  if !a: b
  if !b: a
  if a.val <= b.val: a.next = merge(a.next, b); return a
  else:              b.next = merge(a, b.next); return b
```
- 時間：O(m + n)
- 空間：O(m + n) 呼叫堆疊

## 範例追蹤（解法 1）

`a=[1,2,4], b=[1,3,4]`：依序接 `1(b)、1(a)、2、3、4(a)、4(b)`（細節依比較順序）。

## 關鍵點 / 易錯陷阱

- **dummy 節點**簡化頭節點處理。
- 結束後把剩下未處理的那串「整段」接上即可。
- 比較使用 `<=`，保證穩定（若 LeetCode 不要求穩定也可用 `<`）。
