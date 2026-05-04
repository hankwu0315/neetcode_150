# 0102. Binary Tree Level Order Traversal

- 難度：Medium
- LeetCode：https://leetcode.com/problems/binary-tree-level-order-traversal/

## 題目描述（中文）

層序走訪二元樹，回傳每層節點值（從左到右）的列表。

## 範例 / 限制

- `[3,9,20,null,null,15,7]` → `[[3],[9,20],[15,7]]`
- `[1]` → `[[1]]`
- `[]` → `[]`

## 解法

### 解法（最佳解）：BFS

用 deque，每輪取出當前層所有節點：
```
q = deque([root])
while q:
    layer = []
    for _ in range(len(q)):
        n = q.popleft()
        layer.append(n.val)
        if n.left: q.append(n.left)
        if n.right: q.append(n.right)
    out.append(layer)
```
- 時間：O(n)
- 空間：O(w)

### 解法 2：DFS 帶層號

`dfs(node, level)`：若 `level == len(out)` 新建一層，否則 push。
- 時間：O(n)
- 空間：O(h)

## 關鍵點 / 易錯陷阱

- BFS 一定要記下「當前層長度」再 pop，否則會把下一層的也算進去。
