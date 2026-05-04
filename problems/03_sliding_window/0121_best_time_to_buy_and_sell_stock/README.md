# 121. Best Time to Buy and Sell Stock

**Difficulty**: Easy  **URL**: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

## 題目描述（中文）

`prices[i]` 表示第 `i` 天的股票價格。你只能買一次、賣一次（且必須買後賣），求**最大利潤**。  
若無法獲利，回傳 `0`。

## 範例 / 限制

**範例 1**
```
Input:  prices = [7,1,5,3,6,4]
Output: 5   (第 2 天買 1，第 5 天賣 6 → 利潤 5)
```

**範例 2**
```
Input:  prices = [7,6,4,3,1]
Output: 0   (價格遞減，無法獲利)
```

**限制**
- `1 <= prices.length <= 10⁵`
- `0 <= prices[i] <= 10⁴`

## 解法

### 解法一：暴力雙重迴圈
枚舉所有 `(i, j)`，`i < j`，取最大 `prices[j] - prices[i]`。
- **時間複雜度**：O(n²)
- **空間複雜度**：O(1)

### 最佳解：一遍掃描 + 維護最小價

**核心思路**（可視為「滑動窗口左端永遠是目前見過的最低買點」）：

1. `minPrice = ∞`、`best = 0`。
2. 對每個 `p`：
   - `best = max(best, p - minPrice)`；
   - `minPrice = min(minPrice, p)`。
3. 回傳 `best`。

每天我們只需要知道「迄今最低買價」即可決定今天賣出的最佳利潤。

- **時間複雜度**：O(n)
- **空間複雜度**：O(1)

## 範例追蹤（最佳解）

```
prices = [7,1,5,3,6,4]

p=7: best=max(0, 7-∞)=0,  minPrice=7
p=1: best=max(0, 1-7)=0,   minPrice=1
p=5: best=max(0, 5-1)=4,   minPrice=1
p=3: best=max(4, 3-1)=4,   minPrice=1
p=6: best=max(4, 6-1)=5,   minPrice=1
p=4: best=max(5, 4-1)=5,   minPrice=1

最大利潤 = 5 ✓
```

## 關鍵點 / 易錯陷阱

- **必須先算利潤再更新 minPrice**，否則會用同一天買賣（利潤 0）。
- 若全程未獲利，`best` 維持初始值 0。
- 等價的滑動窗口寫法：左指標停在當前最小價索引，右指標逐日前進。
