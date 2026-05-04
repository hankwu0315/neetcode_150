# 0105. Construct Binary Tree from Preorder and Inorder Traversal

- 難度：Medium
- LeetCode：https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

## 題目描述（中文）

給前序與中序走訪序列（節點值唯一），重建二元樹。

## 範例 / 限制

- `pre=[3,9,20,15,7], in=[9,3,15,20,7]` → `[3,9,20,null,null,15,7]`
- 1 ≤ n ≤ 3000，值唯一。

## 解法

### 解法 1：遞迴（最佳解，配合雜湊表）

- 前序第一個元素是根。
- 在中序中找到根的位置 `idx`，左半中序 = 左子樹，右半 = 右子樹。
- 用 hash map 記 `value -> inorder index`，O(1) 查找。

```
def build(pl, pr, il, ir):
    if pl > pr: return None
    root = TreeNode(pre[pl])
    i = idxMap[pre[pl]]
    leftSize = i - il
    root.left = build(pl+1, pl+leftSize, il, i-1)
    root.right = build(pl+leftSize+1, pr, i+1, ir)
    return root
```
- 時間：O(n)
- 空間：O(n)

## 關鍵點 / 易錯陷阱

- 計算 `leftSize = i - il`，依此切前序左右段。
- 遞迴邊界 `pl > pr` 視為空。
- 序列中值若重複會無法定位（題目保證唯一）。
