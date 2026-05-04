# 1448. Count Good Nodes in Binary Tree

- 難度：Medium
- LeetCode：https://leetcode.com/problems/count-good-nodes-in-binary-tree/

## 題目描述（中文）

「good 節點」定義：從根到該節點路徑上不存在比它大的節點。回傳 good 節點數量。

## 範例 / 限制

- `[3,1,4,3,null,1,5]` → `4`
- `[3,3,null,4,2]` → `3`
- `[1]` → `1`

## 解法

### 解法（最佳解）：DFS 攜帶路徑最大值

```
dfs(n, mx):
    if not n: return 0
    cnt = 1 if n.val >= mx else 0
    new_mx = max(mx, n.val)
    return cnt + dfs(n.left, new_mx) + dfs(n.right, new_mx)
```
- 時間：O(n)
- 空間：O(h)

## 關鍵點 / 易錯陷阱

- 比較條件 `>=`（題目用「無 strictly greater」表示等於也算 good）。
- 初始 `mx = -inf`（或根節點值）。
