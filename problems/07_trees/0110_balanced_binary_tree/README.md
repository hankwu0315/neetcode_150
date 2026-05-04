# 0110. Balanced Binary Tree

- 難度：Easy
- LeetCode：https://leetcode.com/problems/balanced-binary-tree/

## 題目描述（中文）

判斷一棵二元樹是否「高度平衡」：每個節點左右子樹的高度差不超過 1。

## 範例 / 限制

- `[3,9,20,null,null,15,7]` → `true`
- `[1,2,2,3,3,null,null,4,4]` → `false`
- `[]` → `true`

## 解法

### 解法（最佳解）：DFS 後序，回傳深度或 -1

```
def depth(n):
    if n is None: return 0
    L = depth(n.left)
    if L == -1: return -1
    R = depth(n.right)
    if R == -1 or abs(L - R) > 1: return -1
    return 1 + max(L, R)
```
答案為 `depth(root) != -1`。
- 時間：O(n)
- 空間：O(h)

## 關鍵點 / 易錯陷阱

- 樸素做法 `O(n^2)`：每個節點都呼叫一次 `height()`。後序回傳 -1 提前剪枝為 O(n) 最佳。
