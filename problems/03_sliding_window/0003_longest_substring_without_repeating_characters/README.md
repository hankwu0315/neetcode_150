# 3. Longest Substring Without Repeating Characters

**Difficulty**: Medium  **URL**: https://leetcode.com/problems/longest-substring-without-repeating-characters/

## 題目描述（中文）

給定字串 `s`，找出**不含重複字元**的最長子字串長度。

## 範例 / 限制

**範例 1**
```
Input:  s = "abcabcbb"
Output: 3   ("abc")
```

**範例 2**
```
Input:  s = "bbbbb"
Output: 1   ("b")
```

**範例 3**
```
Input:  s = "pwwkew"
Output: 3   ("wke")
```

**限制**
- `0 <= s.length <= 5 × 10⁴`
- 字元為英數字、符號或空白

## 解法

### 解法一：暴力枚舉所有子字串
對每個起點，向右擴展直到出現重複；用 set 判重。
- **時間複雜度**：O(n²)
- **空間複雜度**：O(min(n, |Σ|))

### 最佳解：滑動窗口 + HashMap

**核心思路**：

維護窗口 `[l, r]` 與 dict `lastSeen[c] = c 上次出現的索引`：

1. 右指標 `r` 從 0 走到 n-1，每步：
   - 若 `s[r]` 已在 `lastSeen` 且 `lastSeen[s[r]] >= l`，則把 `l` 跳到 `lastSeen[s[r]] + 1`。
   - 更新 `lastSeen[s[r]] = r`。
   - 更新 `best = max(best, r - l + 1)`。
2. 回傳 `best`。

每個字元最多進入/離開窗口一次。

- **時間複雜度**：O(n)
- **空間複雜度**：O(min(n, |Σ|))

## 範例追蹤（最佳解）

```
s = "abcabcbb"

r=0 'a': lastSeen={a:0},        l=0, best=1 ("a")
r=1 'b': lastSeen={a:0,b:1},    l=0, best=2 ("ab")
r=2 'c': lastSeen={a:0,b:1,c:2}, l=0, best=3 ("abc")
r=3 'a': lastSeen[a]=0 >= l=0  → l=1, lastSeen[a]=3, best=3
r=4 'b': lastSeen[b]=1 >= l=1  → l=2, lastSeen[b]=4, best=3
r=5 'c': lastSeen[c]=2 >= l=2  → l=3, lastSeen[c]=5, best=3
r=6 'b': lastSeen[b]=4 >= l=3  → l=5, lastSeen[b]=6, best=3
r=7 'b': lastSeen[b]=6 >= l=5  → l=7, lastSeen[b]=7, best=3

最終 best = 3 ✓
```

## 關鍵點 / 易錯陷阱

- 用 `lastSeen[c] >= l` 確認**重複位置在當前窗口內**才縮窗口；否則該紀錄是舊的。
- `l` 只能單向前進，不可回退。
- 別忘了空字串回傳 0。
