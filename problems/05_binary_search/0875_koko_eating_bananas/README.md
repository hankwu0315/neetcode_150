# 0875. Koko Eating Bananas

- 難度：Medium
- LeetCode：https://leetcode.com/problems/koko-eating-bananas/

## 題目描述（中文）

`piles[i]` 為第 `i` 堆香蕉的數量，Koko 每小時最多吃 `k` 根。她每小時選一堆吃，
- 若該堆數量 ≥ k：吃掉 `k` 根。
- 否則：把整堆吃完（剩下時間不再吃）。

求在 `h` 小時內吃完所有香蕉的**最小** `k`。

## 範例 / 限制

- `piles = [3,6,7,11], h = 8` → `4`
- `piles = [30,11,23,4,20], h = 5` → `30`
- `piles = [30,11,23,4,20], h = 6` → `23`
- 1 ≤ piles.length ≤ 10^4；piles.length ≤ h ≤ 10^9；1 ≤ piles[i] ≤ 10^9。

## 解法

### 解法 1：暴力遞增搜尋

從 `k = 1` 一路試到 `max(piles)`，第一個能在 `h` 小時內吃完的即答案。
時間 O(max(piles) * n)，會 TLE。

### 解法 2：對速度做二分搜尋（最佳解）

關鍵觀察：**`k` 越大花的時間越少**（單調性）。
所以在 `[1, max(piles)]` 上對 `k` 做二分，用判斷函式：
```
hours(k) = sum(ceil(p / k) for p in piles)
```
找最小的 `k` 使 `hours(k) <= h`。

二分模板（找滿足條件的最小值）：
```
l, r = 1, max(piles)
while l < r:
    mid = (l + r) // 2
    if hours(mid) <= h: r = mid     # 可行 → 縮右
    else:               l = mid + 1 # 不可行 → 提左
return l
```

- 時間：O(n log M)，M = max(piles)
- 空間：O(1)

## 範例追蹤（解法 2）

`piles=[3,6,7,11], h=8`，`l=1, r=11`：
- mid=6 → hours = 1+1+2+2 = 6 ≤ 8 → r=6
- l=1, r=6, mid=3 → hours = 1+2+3+4 = 10 > 8 → l=4
- l=4, r=6, mid=5 → hours = 1+2+2+3 = 8 ≤ 8 → r=5
- l=4, r=5, mid=4 → hours = 1+2+2+3 = 8 ≤ 8 → r=4
- l == r → 回傳 `4` ✓

## 關鍵點 / 易錯陷阱

- `ceil(p / k)` 用整數寫法 `(p + k - 1) // k` 或 `-(-p // k)`，避免浮點誤差。
- 上界用 `max(piles)` 即可（每小時必能吃完一堆，`h >= n`，故必可達）。
- 二分採「找最小可行值」模板：`r = mid`、`l = mid + 1`、迴圈條件 `l < r`。
