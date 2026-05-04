# 0572. Subtree of Another Tree

- 難度：Easy
- LeetCode：https://leetcode.com/problems/subtree-of-another-tree/

## 題目描述（中文）

給定 `root` 與 `subRoot`，判斷 `subRoot` 是否為 `root` 的子樹（必須結構與值完全相同）。

## 範例 / 限制

- `root=[3,4,5,1,2], subRoot=[4,1,2]` → `true`
- `root=[3,4,5,1,2,null,null,null,null,0], subRoot=[4,1,2]` → `false`

## 解法

### 解法（最佳解）：對每個節點呼叫 sameTree

外層遞迴 root，內層 `same(a, b)` 比對：
```
isSubtree(root, sub) =
  if not root: return False
  if same(root, sub): return True
  return isSubtree(root.left, sub) or isSubtree(root.right, sub)
```
- 時間：O(m × n)
- 空間：O(h)

### 解法 2：序列化 + 字串包含

把兩樹序列化（含 None 標記），檢查 sub 序列是否包含於 root 序列。需注意防止部分匹配（每個節點前加 `#`）。
- 時間：O(m + n)（可用 KMP）

## 關鍵點 / 易錯陷阱

- 子樹定義是「整棵子樹」，包含結構；非單純子集合。
- 使用 isSameTree 為 helper。
- 序列化版要用 sentinel 區隔 `null`，避免 `12` 與 `2` 被誤判。
