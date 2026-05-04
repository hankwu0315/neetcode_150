# 0787. Cheapest Flights Within K Stops

- 難度：Medium
- LeetCode：https://leetcode.com/problems/cheapest-flights-within-k-stops/

## 題目描述（中文）

n 城、航班 `flights[i]=[u,v,price]`。從 src 到 dst，最多 K 個中轉站（K+1 條邊）的最低價格；不可達回 -1。

## 範例 / 限制

- `n=4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src=0, dst=3, k=1` → 700

## 解法

### 解法（Bellman-Ford 限步）

對 `K+1` 輪，每輪用上一輪的 dist 進行鬆弛（避免一輪內多步）。

時間 O((K+1)·E)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 必須以「上一輪 dist 快照」鬆弛。直接用當前 dist 會超出步數限制。
