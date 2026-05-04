# 42. Trapping Rain Water

**Difficulty**: Hard  **URL**: https://leetcode.com/problems/trapping-rain-water/

## 題目描述（中文）

給定 `n` 個非負整數 `height`，每個值代表寬度為 1 的柱子高度。  
計算下雨後能**儲存多少水**。

每根柱子位置 `i` 上方可儲水量 = `min(leftMax[i], rightMax[i]) - height[i]`，其中 `leftMax[i]` 為 `height[0..i]` 最大值，`rightMax[i]` 為 `height[i..n-1]` 最大值。

## 範例 / 限制

**範例 1**
```
Input:  height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
```

**範例 2**
```
Input:  height = [4,2,0,3,2,5]
Output: 9
```

**限制**
- `n == height.length`
- `1 <= n <= 2 × 10⁴`
- `0 <= height[i] <= 10⁵`

## 解法

### 解法一：暴力（每位置兩邊最大）
對每個 `i` 各自掃描左右最大值。
- **時間複雜度**：O(n²)
- **空間複雜度**：O(1)

### 解法二：前綴後綴最大值陣列
預先計算 `leftMax[]`、`rightMax[]`，再求每位置儲水。
- **時間複雜度**：O(n)
- **空間複雜度**：O(n)

### 最佳解：雙指標 + 維護 leftMax / rightMax

**核心思路**：

維護兩個指標 `l, r` 與兩個最大值 `lMax, rMax`：
- **若 `height[l] < height[r]`**：左側必然受 `lMax` 限制（因為 `rightMax >= height[r] > height[l]` 已保證右側更高）。
  - 更新 `lMax = max(lMax, height[l])`。
  - 累加水量 `lMax - height[l]`。
  - `l += 1`。
- **否則**：對稱地處理右側，`r -= 1`。

每步至少前進一個指標，O(n) 且只用常數空間。

- **時間複雜度**：O(n)
- **空間複雜度**：O(1)

## 範例追蹤（最佳解）

```
height = [0,1,0,2,1,0,1,3,2,1,2,1]

l=0,r=11, lMax=0,rMax=0
h[0]=0 < h[11]=1: lMax=0, water+=0, l=1
h[1]=1 == h[11]=1: 走 else 分支, rMax=1, water+=0, r=10
h[1]=1 < h[10]=2: lMax=1, water+=0, l=2
h[2]=0 < h[10]=2: lMax=1, water += 1-0 = 1, l=3
h[3]=2 == h[10]=2: rMax=2, water+=0, r=9
h[3]=2 > h[9]=1: rMax=2, water += 2-1 = 1, r=8
h[3]=2 == h[8]=2: rMax=2, water+=0, r=7
h[3]=2 < h[7]=3: lMax=2, water+=0, l=4
h[4]=1 < h[7]=3: lMax=2, water += 2-1 = 1, l=5
h[5]=0 < h[7]=3: lMax=2, water += 2-0 = 2, l=6
h[6]=1 < h[7]=3: lMax=2, water += 2-1 = 1, l=7
l==r 結束

合計 = 0+0+0+1+0+1+0+0+1+2+1 = 6 ✓
```

## 關鍵點 / 易錯陷阱

- 雙指標精髓：只要 `height[l] < height[r]`，左側受 `lMax` 限制（因右邊保證更高的「牆」存在），可安全結算左側。
- `lMax`、`rMax` 必須先更新再加水（避免 `lMax < height[l]` 的負數）。
- 邊界 `n < 3` 時無法積水，雙指標自動回傳 0。
