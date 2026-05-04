# 0210. Course Schedule II

- 難度：Medium
- LeetCode：https://leetcode.com/problems/course-schedule-ii/

## 題目描述（中文）

同 0207，但要回傳一個合法上課順序；若不可能回 `[]`。

## 範例 / 限制

- `numCourses=2, [[1,0]]` → `[0,1]`
- `numCourses=4, [[1,0],[2,0],[3,1],[3,2]]` → `[0,1,2,3]` 或 `[0,2,1,3]`

## 解法

### 解法（拓撲排序 / Kahn）

把出佇列順序當答案。最後若長度 < n 表示有環回 `[]`。

時間 O(V+E)，空間 O(V+E)。

## 關鍵點 / 易錯陷阱

- 答案不唯一；測試以「是否為合法拓撲序列」驗證。
