# 217. Contains Duplicate

**Difficulty**: Easy  **URL**: https://leetcode.com/problems/contains-duplicate/

## 題目描述（中文）

給定一個整數陣列 `nums`，如果任一元素在陣列中**至少出現兩次**，返回 `true`；如果每個元素都不同，返回 `false`。

## 範例 / 限制

**範例 1**
```
Input:  nums = [1,2,3,1]
Output: true
```

**範例 2**
```
Input:  nums = [1,2,3,4]
Output: false
```

**範例 3**
```
Input:  nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
```

**限制**
- `1 <= nums.length <= 10⁵`
- `-10⁹ <= nums[i] <= 10⁹`

## 解法

### 解法一：暴力法（兩兩比較）
雙重迴圈枚舉所有 `(i, j)` 配對，若 `nums[i] == nums[j]` 即返回 `true`。
- **時間複雜度**：O(n²)
- **空間複雜度**：O(1)

### 解法二：排序後比鄰
先排序，再檢查相鄰元素是否相等。
- **時間複雜度**：O(n log n)
- **空間複雜度**：O(1)（不計排序的內部空間）

### 最佳解：雜湊集合（HashSet）

**核心思路**：
1. 走訪陣列，維護一個集合 `seen` 紀錄已見過的元素。
2. 對每個 `x`，若 `x in seen` 立即回傳 `true`。
3. 否則 `seen.add(x)`，繼續。
4. 全部走完未發現重複，回傳 `false`。

雜湊集合的查詢與插入皆為均攤 O(1)，因此整體 O(n)。

- **時間複雜度**：O(n)
- **空間複雜度**：O(n)

## 範例追蹤（最佳解）

```
nums = [1,2,3,1]
seen = {}

i=0: 1 ∉ seen → seen = {1}
i=1: 2 ∉ seen → seen = {1,2}
i=2: 3 ∉ seen → seen = {1,2,3}
i=3: 1 ∈ seen → 回傳 true ✓
```

## 關鍵點 / 易錯陷阱

- 集合雜湊衝突最壞情況為 O(n) 查詢，但平均 O(1)。
- 若元素值範圍極小，可改用陣列計數降低常數時間。
- Python 還可一行 `len(set(nums)) != len(nums)`，但會掃完整個陣列，比早退出版本略慢。
- 排序解法雖空間 O(1) 但會破壞原陣列順序，視題目限制取捨。
