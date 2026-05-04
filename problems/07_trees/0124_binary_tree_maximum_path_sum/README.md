# 0124. Binary Tree Maximum Path Sum

- 難度：Hard
- LeetCode：https://leetcode.com/problems/binary-tree-maximum-path-sum/

## 題目描述（中文）

樹中「路徑」指任意節點序列（透過父子相連），不必經過根。求所有路徑節點值總和的最大值。

## 範例 / 限制

- `[1,2,3]` → `6`（2-1-3）
- `[-10,9,20,null,null,15,7]` → `42`（15-20-7）
- `[-3]` → `-3`（必須至少一個節點）

## 解法

### 解法（最佳解）：DFS 後序回傳「向上單邊最大貢獻」

```
def gain(n):
    if not n: return 0
    L = max(0, gain(n.left))   # 負貢獻就不取
    R = max(0, gain(n.right))
    self.ans = max(self.ans, n.val + L + R)  # 在此節點折返的路徑
    return n.val + max(L, R)   # 向上只能選一邊
```
- 時間：O(n)
- 空間：O(h)

## 範例追蹤

`[-10,9,20,null,null,15,7]`：
- 葉 9,15,7 各自 gain=自身。
- 節點 20：L=15,R=7，ans = max(ans, 20+15+7) = 42，回傳 20+15=35。
- 根 -10：L=9, R=35，ans = max(42, -10+9+35)=42，最終 42 ✓。

## 關鍵點 / 易錯陷阱

- 子樹貢獻取 `max(0, ...)`：負就視為不選。
- 每個節點兩種角色：(1) 折返路徑端點（更新答案）；(2) 向上單邊（回傳給父）。
- 答案初始 `-inf`，因為節點值可能全為負。
