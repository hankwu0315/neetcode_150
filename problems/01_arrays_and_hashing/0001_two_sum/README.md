# 1. Two Sum

**Difficulty**: Easy  **URL**: https://leetcode.com/problems/two-sum/

## 題目描述（中文）

給定一個整數陣列 `nums` 和一個整數 `target`，請在陣列中找出**兩個不同索引** `i, j`，使得 `nums[i] + nums[j] == target`，並回傳這兩個索引（順序不限）。  
題目保證**恰好存在一組答案**，且同一個元素不能重複使用。

## 範例 / 限制

**範例 1**
```
Input:  nums = [2,7,11,15], target = 9
Output: [0,1]
解釋：nums[0] + nums[1] = 2 + 7 = 9
```

**範例 2**
```
Input:  nums = [3,2,4], target = 6
Output: [1,2]
```

**範例 3**
```
Input:  nums = [3,3], target = 6
Output: [0,1]
```

**限制**
- `2 <= nums.length <= 10⁴`
- `-10⁹ <= nums[i] <= 10⁹`
- `-10⁹ <= target <= 10⁹`
- 恰有唯一解。

## 解法

### 解法一：暴力法
雙重迴圈枚舉所有 `(i, j)` 配對，找到 `nums[i] + nums[j] == target` 即回傳。
- **時間複雜度**：O(n²)
- **空間複雜度**：O(1)

### 最佳解：一遍雜湊（One-pass HashMap）

**核心思路**：
1. 走訪 `nums`，對每個元素 `x = nums[i]`，計算其互補值 `complement = target - x`。
2. 若 `complement` 已在雜湊表中（先前看過），表示找到答案 → 回傳 `[seen[complement], i]`。
3. 否則 `seen[x] = i`，繼續。
4. 因題目保證恰一解，必定能在掃描中命中。

雜湊查詢平均 O(1)，整體 O(n) 一遍掃描。

- **時間複雜度**：O(n)
- **空間複雜度**：O(n)

## 範例追蹤（最佳解）

```
nums = [2,7,11,15], target = 9
seen = {}

i=0, x=2:  complement = 9-2 = 7，7 ∉ seen → seen = {2:0}
i=1, x=7:  complement = 9-7 = 2，2 ∈ seen → 回傳 [seen[2], 1] = [0, 1] ✓
```

## 關鍵點 / 易錯陷阱

- 「不能用同一索引兩次」是關鍵 → 在迴圈內**先查表再寫表**，避免重複使用自己。
- 若改寫成「先建表，再查找」會踩到自己（例如 `nums=[3,3], target=6` 會返回 `[1,1]`）。
- 雜湊表用「值 → 索引」儲存。
- 兩個答案的順序不重要，但 LeetCode 的 judge 會自動容忍順序。
