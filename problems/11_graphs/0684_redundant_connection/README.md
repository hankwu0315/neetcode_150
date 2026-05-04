# 0684. Redundant Connection

- 難度：Medium
- LeetCode：https://leetcode.com/problems/redundant-connection/

## 題目描述（中文）

n 個節點 (1..n)、n 條無向邊；移除一條邊後成為樹。回傳「在輸入中最後出現的、能讓其成樹」的多餘邊。

## 範例 / 限制

- `[[1,2],[1,3],[2,3]]` → `[2,3]`

## 解法

### 解法（Union-Find）

依序 union；當某邊兩端已同根時，這條就是要移除的多餘邊。

時間 ~O(n·α(n))。

## 關鍵點 / 易錯陷阱

- 題目保證恰有一條多餘邊；遇到第一個衝突即可回傳。
