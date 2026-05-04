# 0226. Invert Binary Tree

- 難度：Easy
- LeetCode：https://leetcode.com/problems/invert-binary-tree/

## 題目描述（中文）

反轉一棵二元樹（鏡像翻轉每個節點的左右子）。

## 範例 / 限制

- `[4,2,7,1,3,6,9]` → `[4,7,2,9,6,3,1]`
- `[]` → `[]`

## 解法

### 解法 1：DFS 遞迴（最佳解）

```
invert(root):
    if root is None: return None
    root.left, root.right = invert(root.right), invert(root.left)
    return root
```
- 時間：O(n)
- 空間：O(h)（呼叫堆疊；偏斜樹 O(n)）

### 解法 2：BFS 迭代

用佇列逐層交換每個節點的左右子。
- 時間：O(n)
- 空間：O(w)（最寬層）

## 範例追蹤

`[4,2,7,...]`：根 4 交換 → 左 7 右 2，遞迴下去全部鏡像。

## 關鍵點 / 易錯陷阱

- 要在交換**之前**先取回兩個子樹的反轉值，再 assign 給左右；Python 同行 tuple 拆解可一次完成。
