# 167. Two Sum II - Input Array Is Sorted

**Difficulty**: Medium  **URL**: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

## 題目描述（中文）

給定一個**已遞增排序**的整數陣列 `numbers`（1-indexed）與目標 `target`，找出兩個數的索引（1-based）使其和為 `target`。  
保證恰有一組解，且每個元素只能使用一次。

**進階**：必須使用 **常數額外空間**。

## 範例 / 限制

**範例 1**
```
Input:  numbers = [2,7,11,15], target = 9
Output: [1,2]
```

**範例 2**
```
Input:  numbers = [2,3,4], target = 6
Output: [1,3]
```

**範例 3**
```
Input:  numbers = [-1,0], target = -1
Output: [1,2]
```

**限制**
- `2 <= numbers.length <= 3 × 10⁴`
- `-1000 <= numbers[i] <= 1000`
- `numbers` 已遞增排序
- 答案存在且唯一

## 解法

### 解法一：HashMap（不利用排序）
與 1. Two Sum 相同方法。
- **時間複雜度**：O(n)
- **空間複雜度**：O(n)（不符合常數空間進階要求）

### 最佳解：雙指標相向收斂

**核心思路**：

1. 設 `l = 0, r = n - 1`。
2. 計算 `total = numbers[l] + numbers[r]`：
   - 若 `total == target` → 回傳 `[l+1, r+1]`。
   - 若 `total < target` → `l += 1`（需更大的數）。
   - 若 `total > target` → `r -= 1`（需更小的數）。
3. 重複直到找到答案（題目保證存在）。

利用排序的單調性：移動指標的方向是確定的。

- **時間複雜度**：O(n)
- **空間複雜度**：O(1)

## 範例追蹤（最佳解）

```
numbers = [2, 7, 11, 15], target = 9

l=0, r=3: 2 + 15 = 17 > 9 → r=2
l=0, r=2: 2 + 11 = 13 > 9 → r=1
l=0, r=1: 2 + 7  = 9  ✓ → 回傳 [1, 2]
```

## 關鍵點 / 易錯陷阱

- 答案是 **1-based**，記得 `+1`。
- 排序的特性使雙指標方向是**單調且確定**的，這是線性時間的關鍵。
- 不使用排序則無法達到 O(1) 空間。
