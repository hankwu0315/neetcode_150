# 0046. Permutations

- 難度：Medium
- LeetCode：https://leetcode.com/problems/permutations/

## 題目描述（中文）

給互異整數陣列 `nums`，回傳所有排列。

## 範例 / 限制

- `[1,2,3]` → 6 個排列。
- 1 ≤ nums.length ≤ 6。

## 解法

### 解法（回溯）

`used[]` 標記用過；dfs 時遍歷所有未用的，加入 path 後遞迴。

時間 O(N · N!)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 結果要 deep copy。
