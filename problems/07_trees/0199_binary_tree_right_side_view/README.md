# 0199. Binary Tree Right Side View

- 難度：Medium
- LeetCode：https://leetcode.com/problems/binary-tree-right-side-view/

## 題目描述（中文）

從右側看二元樹，回傳每層最右邊的節點值（由上而下）。

## 範例 / 限制

- `[1,2,3,null,5,null,4]` → `[1,3,4]`
- `[1,null,3]` → `[1,3]`
- `[]` → `[]`

## 解法

### 解法 1：BFS 取每層最後一個（最佳解）

層序走訪，每層 push 最後一個節點值。
- 時間：O(n)
- 空間：O(w)

### 解法 2：DFS 先走右

`dfs(n, depth)`：若 `depth == len(out)` 表示這層第一次到達 → push 值。先走 right。
- 時間：O(n)
- 空間：O(h)

## 關鍵點 / 易錯陷阱

- 「右側可見」未必是右子；若右子缺失，左子可能露出，所以是「每層最後一個（按層序左到右）」。
