# 0235. Lowest Common Ancestor of a BST

- 難度：Medium
- LeetCode：https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

## 題目描述（中文）

在 BST 中找兩節點 p、q 的最近公共祖先（LCA）。

## 範例 / 限制

- `[6,2,8,0,4,7,9,null,null,3,5], p=2, q=8` → `6`
- `[6,2,8,0,4,7,9,null,null,3,5], p=2, q=4` → `2`

## 解法

### 解法（最佳解）：BST 性質沿樹下走

```
while node:
    if p.val < node.val and q.val < node.val: node = node.left
    elif p.val > node.val and q.val > node.val: node = node.right
    else: return node
```
當 p、q 分別位於兩側（或其中一個就是 node）時，當前 node 即為 LCA。
- 時間：O(h)
- 空間：O(1)（迭代）/ O(h)（遞迴）

## 關鍵點 / 易錯陷阱

- 利用 BST 排序性，不必遞迴搜尋整棵樹。
- 第一個「分叉點」就是 LCA；節點本身可以是它後代的祖先。
