# 0543. Diameter of Binary Tree

- 難度：Easy
- LeetCode：https://leetcode.com/problems/diameter-of-binary-tree/

## 題目描述（中文）

二元樹的「直徑」為任兩節點間最長路徑上的**邊數**（不一定經過根）。

## 範例 / 限制

- `[1,2,3,4,5]` → `3`（4-2-1-3 或 5-2-1-3）
- `[1,2]` → `1`
- `[]` → `0`

## 解法

### 解法（最佳解）：DFS 後序，回傳深度同時更新答案

```
def depth(node):
    if not node: return 0
    L = depth(node.left)
    R = depth(node.right)
    self.ans = max(self.ans, L + R)
    return 1 + max(L, R)
```
- 時間：O(n)
- 空間：O(h)

## 範例追蹤

`[1,2,3,4,5]`：
- 葉 4,5,3 深度 1。
- 節點 2：L=1,R=1，updates ans=2，回 2。
- 根 1：L=2,R=1，updates ans=3，回 3。最終答案 3 ✓。

## 關鍵點 / 易錯陷阱

- 直徑是**邊數**，所以累計用 `L + R`（不是 `+1`）。
- 答案需要在 DFS 過程中以閉包/實例變數更新，因為答案不一定來自根。
