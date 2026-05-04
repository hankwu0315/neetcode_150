# 0090. Subsets II

- 難度：Medium
- LeetCode：https://leetcode.com/problems/subsets-ii/

## 題目描述（中文）

給可能含重複元素的整數陣列 `nums`，回傳所有不同子集（power set 去重）。

## 範例 / 限制

- `[1,2,2]` → `[[],[1],[1,2],[1,2,2],[2],[2,2]]`

## 解法

### 解法（回溯 + 排序）

排序後 dfs(i)：
- 收集 path。
- `for j in [i..n)`：若 `j > i and nums[j] == nums[j-1]`：跳過。
- 加入 → dfs(j+1) → 回溯。

時間 O(N · 2^N)，空間 O(N)。

## 關鍵點 / 易錯陷阱

- 同層去重條件 `j > i`，保留每層首個重複值代表。
