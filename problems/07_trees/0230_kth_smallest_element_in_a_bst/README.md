# 0230. Kth Smallest Element in a BST

- 難度：Medium
- LeetCode：https://leetcode.com/problems/kth-smallest-element-in-a-bst/

## 題目描述（中文）

在 BST 中找第 k 小的值（1-indexed）。

## 範例 / 限制

- `[3,1,4,null,2], k=1` → `1`
- `[5,3,6,2,4,null,null,1], k=3` → `3`

## 解法

### 解法（最佳解）：中序走訪迭代版

BST 中序輸出即升序。用 stack 模擬，每 pop 一次 `k -= 1`，到 0 即答案。
```
stack = []; cur = root
while True:
    while cur:
        stack.append(cur); cur = cur.left
    cur = stack.pop()
    k -= 1
    if k == 0: return cur.val
    cur = cur.right
```
- 時間：O(h + k)
- 空間：O(h)

### 解法 2：遞迴中序計數

走到第 k 個就回傳。同樣 O(h + k)。

## 關鍵點 / 易錯陷阱

- BST 中序 = 升序。不需要排序整棵樹。
- 若會頻繁查詢 + 修改：可在每個節點存子樹大小，將查詢降為 O(h)。
