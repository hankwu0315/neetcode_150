# 1584. Min Cost to Connect All Points

- 難度：Medium
- LeetCode：https://leetcode.com/problems/min-cost-to-connect-all-points/

## 題目描述（中文）

平面整數點 `points`，兩點距離為 Manhattan。求把所有點連通的最小總邊權（MST）。

## 範例 / 限制

- `[[0,0],[2,2],[3,10],[5,2],[7,0]]` → 20

## 解法

### 解法（Prim with min-heap）

從點 0 開始；每次取到最近未訪問的點加入，並用其到其他點的距離鬆弛。

時間 O(N² log N)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 點數 ≤ 1000，N² 邊可接受。
