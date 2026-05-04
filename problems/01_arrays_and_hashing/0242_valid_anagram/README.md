# 242. Valid Anagram

**Difficulty**: Easy  **URL**: https://leetcode.com/problems/valid-anagram/

## 題目描述（中文）

給定兩個字串 `s` 和 `t`，判斷 `t` 是否為 `s` 的**字母異位詞**（anagram）。  
所謂字母異位詞，是指由相同字母重新排列組成的字串，且每個字母出現的次數相同。

## 範例 / 限制

**範例 1**
```
Input:  s = "anagram", t = "nagaram"
Output: true
```

**範例 2**
```
Input:  s = "rat", t = "car"
Output: false
```

**限制**
- `1 <= s.length, t.length <= 5 × 10⁴`
- `s` 與 `t` 僅由英文小寫字母組成

**進階**：若輸入含 Unicode 字元，該如何調整？

## 解法

### 解法一：排序比較
將兩個字串各自轉為字元陣列排序後比較。
- **時間複雜度**：O(n log n)
- **空間複雜度**：O(n)（字元複本）

### 最佳解：計數雜湊（Counting Hash）

**核心思路**：
1. 若兩字串長度不同，直接回傳 `false`。
2. 用一個長度 26（或 dict）的計數陣列。
3. 走訪 `s` 時 `count[c] += 1`，走訪 `t` 時 `count[c] -= 1`。
4. 最後檢查所有計數是否皆為 0。

或更簡潔：直接比較兩個字串各自的計數字典。

- **時間複雜度**：O(n)
- **空間複雜度**：O(1)（固定 26 個槽）；若為 Unicode 則為 O(k)。

## 範例追蹤（最佳解）

```
s = "anagram", t = "nagaram"
count = [0]*26

掃 s：a:+3, n:+1, g:+1, r:+1, m:+1
掃 t：a:-3, n:-1, g:-1, r:-1, m:-1

結果：count 全為 0 → 回傳 true ✓
```

## 關鍵點 / 易錯陷阱

- 必須先檢查長度。
- Unicode：26 槽不夠，改用 `dict`/`Map` 計數。
- 若記憶體緊：可用 +/- 同一陣列，最後檢查全 0；省掉建兩個字典。
- 排序解雖較直觀但比 O(n) 慢。
