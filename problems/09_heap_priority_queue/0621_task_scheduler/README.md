# 0621. Task Scheduler

- 難度：Medium
- LeetCode：https://leetcode.com/problems/task-scheduler/

## 題目描述（中文）

CPU 任務由字母表示。相同任務之間至少間隔 n 個冷卻週期（可填其他任務或閒置）。求完成所有任務所需的最小總週期數。

## 範例 / 限制

- `tasks=["A","A","A","B","B","B"], n=2` → `8`（A B idle A B idle A B）
- `tasks=["A","A","A","B","B","B"], n=0` → `6`
- 1 ≤ tasks.length ≤ 10^4，0 ≤ n ≤ 100。

## 解法

### 解法（最佳解）：數學公式

設最大頻率 `maxF`，與最大頻率相同次數的任務有 `maxCount` 個：
```
ans = max(len(tasks), (maxF - 1) * (n + 1) + maxCount)
```
直覺：把出現最多的任務分散在 maxF 個「組」中，每組長 (n+1)；最後一組多塞 maxCount 個並列尾巴。
- 時間：O(N)
- 空間：O(1)（26 字母）

### 解法 2：模擬 max-heap + 冷卻佇列

每次選最大計數任務執行，放入冷卻佇列；冷卻時間到再放回堆。略。

## 範例追蹤

`["A","A","A","B","B","B"], n=2`：maxF=3, maxCount=2 → (3-1)*3 + 2 = 8 ✓。

## 關鍵點 / 易錯陷阱

- 若任務種類多，公式可能 < len(tasks)，故取 max。
- maxCount 為「與最大頻率相等」的任務數量，不是最大頻率本身。
