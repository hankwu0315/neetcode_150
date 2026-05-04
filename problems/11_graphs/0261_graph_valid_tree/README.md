# 0261. Graph Valid Tree

- 難度：Medium
- LeetCode：https://leetcode.com/problems/graph-valid-tree/

## 題目描述（中文）

n 個節點 (0..n-1)、若干無向邊。判斷是否構成樹（連通且無環）。

## 範例 / 限制

- `n=5, [[0,1],[0,2],[0,3],[1,4]]` → true
- `n=5, [[0,1],[1,2],[2,3],[1,3],[1,4]]` → false（含環）

## 解法

### 解法（Union-Find）

樹的等價條件：邊數 = n-1 且無環。對每條邊 union；若兩端已同根 → 有環 → false。最後若 |edges|==n-1 即為樹。

時間 ~O(n·α(n))，空間 O(n)。

## 關鍵點 / 易錯陷阱

- 必須兩條件齊備（連通 + 無環）；單檢查無環不足。
