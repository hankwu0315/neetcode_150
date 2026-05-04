# 424. Longest Repeating Character Replacement

**Difficulty**: Medium  **URL**: https://leetcode.com/problems/longest-repeating-character-replacement/

## 題目描述（中文）

給定字串 `s`（只含大寫字母）與整數 `k`。可將任意 `k` 個字元換成任意大寫字母，求換完後最長**全相同字元子字串**的長度。

## 範例 / 限制

**範例 1**
```
Input:  s = "ABAB", k = 2
Output: 4   (將 2 個 'A' 改成 'B'，整串變 "BBBB")
```

**範例 2**
```
Input:  s = "AABABBA", k = 1
Output: 4   ("AABA" → "AAAA" 或 "ABBB" → "BBBB")
```

**限制**
- `1 <= s.length <= 10⁵`
- `s` 全為大寫英文字母
- `0 <= k <= s.length`

## 解法

### 解法一：枚舉每種主導字母 + 雙指標
對 26 個字母 `c`，問「最長子字串其非 `c` 字元數 ≤ k」。
- **時間複雜度**：O(26 · n) = O(n)
- **空間複雜度**：O(1)

### 最佳解：單一滑動窗口 + 計數最大頻

**核心思路**：

維護窗口 `[l, r]` 與計數 `count[26]`，並設 `maxCount = max(count[c])`：
- 窗口合法的條件是 **`(r - l + 1) - maxCount <= k`**（窗口長度 - 最常字母 = 需替換的字元數）。
- 對每個 `r`：把 `s[r]` 加入計數、更新 `maxCount`。
- 若不合法 → `l += 1`（並把 `s[l]` 移出計數，注意 `maxCount` **不需嚴格更新**：縮一格不會讓答案變得更大）。

關鍵巧思：`maxCount` 不下降，因為我們只在乎「歷史曾達到的最大窗口」，因此即使縮小窗口時 `maxCount` 偏大也沒關係 —— 它只會讓條件「假性」放寬，但不可能輸出更大的錯誤答案。

- **時間複雜度**：O(n)
- **空間複雜度**：O(1)（26 元）

## 範例追蹤（最佳解）

```
s = "AABABBA", k = 1

r=0 'A': count={A:1}, maxCount=1, len=1, valid
r=1 'A': count={A:2}, maxCount=2, len=2, valid
r=2 'B': count={A:2,B:1}, maxCount=2, len=3, 3-2=1≤k, valid
r=3 'A': count={A:3,B:1}, maxCount=3, len=4, 4-3=1≤k, valid (best=4)
r=4 'B': count={A:3,B:2}, maxCount=3, len=5, 5-3=2>k → l=1, count={A:2,B:2}, len=4
r=5 'B': count={A:2,B:3}, maxCount=3, len=5, 5-3=2>k → l=2, count={A:1,B:3}, len=4
r=6 'A': count={A:2,B:3}, maxCount=3, len=5, 5-3=2>k → l=3, count={A:1,B:3}? 
        實際上 l 從 2 移到 3, 移出 s[2]='B' → count={A:1,B:2}, len=4
最佳 = 4 ✓
```

## 關鍵點 / 易錯陷阱

- `maxCount` **可以「遲滯」**：縮窗時不嚴格降低，因為我們只想擴大窗口；偏大的 `maxCount` 只會延後縮窗，但答案以「過去最大窗長」為準。
- 條件式：`window_len - maxCount > k` 才縮窗。
- 縮窗時記得 `count[s[l]] -= 1`，再 `l += 1`。
- 答案就是最終窗口長度（`r - l + 1` 隨著迴圈結束保留最大長）。
