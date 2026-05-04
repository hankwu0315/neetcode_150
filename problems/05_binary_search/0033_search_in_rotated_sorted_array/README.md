# 0033. Search in Rotated Sorted Array

- 難度：Medium
- LeetCode：https://leetcode.com/problems/search-in-rotated-sorted-array/

## 題目描述（中文）

升序、元素互異的陣列旋轉一次後得到 `nums`。在其中搜尋 `target`，存在則回傳索引，否則回傳 `-1`。要求 O(log n)。

## 範例 / 限制

- `nums = [4,5,6,7,0,1,2], target = 0` → `4`
- `nums = [4,5,6,7,0,1,2], target = 3` → `-1`
- `nums = [1], target = 0` → `-1`
- 元素互異；1 ≤ n ≤ 5000。

## 解法

### 解法 1：一次二分（最佳解）

二分時，至少有一半（左或右）是已排序的。以 `mid` 為界判斷：

```
mid = (l + r) // 2
if nums[mid] == target: return mid
if nums[l] <= nums[mid]:  # 左半已排序
    if nums[l] <= target < nums[mid]:
        r = mid - 1
    else:
        l = mid + 1
else:                     # 右半已排序
    if nums[mid] < target <= nums[r]:
        l = mid + 1
    else:
        r = mid - 1
```

- 時間：O(log n)
- 空間：O(1)

### 解法 2：先找旋轉點再二分

第一次二分找最小值索引 `pivot`，再對 `[0, pivot-1]` 或 `[pivot, n-1]` 做標準二分。
時間 O(log n)，但實作較長。

## 範例追蹤（解法 1）

`nums = [4,5,6,7,0,1,2], target = 0`，l=0, r=6

| l | r | mid | nums[mid] | 已排序半 | 判斷 | 動作 |
|---|---|---|---|---|---|---|
| 0 | 6 | 3 | 7 | 左半 [4,5,6,7] | 0 不在 [4,7) | l=4 |
| 4 | 6 | 5 | 1 | 左半 [0,1] | 0 在 [0,1) | r=4 |
| 4 | 4 | 4 | 0 | — | 命中 | 回傳 `4` ✓ |

## 關鍵點 / 易錯陷阱

- 判斷哪半已排序：`nums[l] <= nums[mid]`（**含等號**，當 l==mid 時左半只 1 個元素仍是排序）。
- 區間用「半閉」`[a, b)`：`nums[l] <= target < nums[mid]`，避免把 `nums[mid]` 重算。
- 標的不在排序的那一半時，丟到另一半繼續二分。
