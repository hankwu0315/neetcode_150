# 0104. Maximum Depth of Binary Tree

- 難度：Easy
- LeetCode：https://leetcode.com/problems/maximum-depth-of-binary-tree/

## 題目描述（中文）

回傳二元樹的最大深度（從根到最遠葉的節點數）。

## 範例 / 限制

- `[3,9,20,null,null,15,7]` → `3`
- `[1,null,2]` → `2`
- `[]` → `0`

## 解法

### 解法 1：DFS 遞迴（最佳解）

`depth(root) = 0 if None else 1 + max(depth(left), depth(right))`。
- 時間：O(n)
- 空間：O(h)

### 解法 2：BFS 逐層

層序走訪，計層數。
- 時間：O(n)
- 空間：O(w)

## 關鍵點 / 易錯陷阱

- 空樹回傳 0；只有根節點回 1。
