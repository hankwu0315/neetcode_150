# 0100. Same Tree

- 難度：Easy
- LeetCode：https://leetcode.com/problems/same-tree/

## 題目描述（中文）

判斷兩棵二元樹是否完全相同（結構與每個節點值皆相同）。

## 範例 / 限制

- `[1,2,3], [1,2,3]` → `true`
- `[1,2], [1,null,2]` → `false`
- `[1,2,1], [1,1,2]` → `false`

## 解法

### 解法（最佳解）：DFS 同步遞迴

```
same(p, q):
    if not p and not q: return true
    if not p or not q: return false
    return p.val == q.val and same(p.left, q.left) and same(p.right, q.right)
```
- 時間：O(min(m, n))
- 空間：O(min(h_p, h_q))

## 關鍵點 / 易錯陷阱

- 兩個都為 None 才是 true；單邊 None 立刻 false。
