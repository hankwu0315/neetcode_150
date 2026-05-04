# 0207. Course Schedule

- 難度：Medium
- LeetCode：https://leetcode.com/problems/course-schedule/

## 題目描述（中文）

`numCourses` 課程編號 0..n-1，`prerequisites[i]=[a,b]` 代表上 a 前要先上 b。問是否能修完全部（即圖中無環）。

## 範例 / 限制

- `numCourses=2, [[1,0]]` → true
- `numCourses=2, [[1,0],[0,1]]` → false

## 解法

### 解法（拓撲排序 / Kahn）

統計入度，所有入度 0 推入佇列；每次彈出一節並使其後繼入度 -1，若降為 0 入佇列；最後 visited==n 表示無環。

時間 O(V+E)，空間 O(V+E)。

## 關鍵點 / 易錯陷阱

- 圖方向：`b → a`（先決→後修）。
