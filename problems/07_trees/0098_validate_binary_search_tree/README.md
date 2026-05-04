# 0098. Validate Binary Search Tree

- 難度：Medium
- LeetCode：https://leetcode.com/problems/validate-binary-search-tree/

## 題目描述（中文）

判斷一棵二元樹是否為合法的 BST：
- 每節點左子樹所有值 **嚴格小於** 該節點。
- 每節點右子樹所有值 **嚴格大於** 該節點。

## 範例 / 限制

- `[2,1,3]` → `true`
- `[5,1,4,null,null,3,6]` → `false`（4 < 5 違反右子樹 > root）

## 解法

### 解法 1：DFS 攜帶 (low, high) 邊界（最佳解）

```
def valid(n, low, high):
    if not n: return True
    if not (low < n.val < high): return False
    return valid(n.left, low, n.val) and valid(n.right, n.val, high)
```
初始 `low = -inf, high = +inf`。
- 時間：O(n)
- 空間：O(h)

### 解法 2：中序走訪 + 嚴格遞增

中序輸出應嚴格遞增；維護 `prev`，若 `n.val <= prev` 失敗。
- 時間：O(n)
- 空間：O(h)

## 關鍵點 / 易錯陷阱

- 用 `<`，不是 `<=`（題目要求嚴格）。
- 不能只與直接父節點比較；必須與整個祖先路徑的「上下界」比較。
