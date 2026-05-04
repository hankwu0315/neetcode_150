# 125. Valid Palindrome

**Difficulty**: Easy  **URL**: https://leetcode.com/problems/valid-palindrome/

## 題目描述（中文）

判斷字串 `s` 是否為**回文**。  
判斷時：
- 將所有大寫字母轉為小寫；
- 移除所有非英數字元（non-alphanumeric）後再比較。

## 範例 / 限制

**範例 1**
```
Input:  s = "A man, a plan, a canal: Panama"
Output: true   解釋：清理後為 "amanaplanacanalpanama"
```

**範例 2**
```
Input:  s = "race a car"
Output: false  解釋：清理後為 "raceacar"
```

**範例 3**
```
Input:  s = " "
Output: true   解釋：清理後為空字串，視為回文
```

**限制**
- `1 <= s.length <= 2 × 10⁵`
- `s` 由可列印 ASCII 字元組成

## 解法

### 解法一：清理 + 反轉比較
過濾出英數字並轉小寫得 `t`，比較 `t == t[::-1]`。
- **時間複雜度**：O(n)
- **空間複雜度**：O(n)

### 最佳解：雙指標原地比較

**核心思路**：
1. 左指標 `l = 0`、右指標 `r = n - 1`。
2. 跳過非英數字元：`l` 向右、`r` 向左移動直到指到合法字元。
3. 比較 `s[l].lower() == s[r].lower()`，否則回傳 `false`。
4. `l += 1, r -= 1`，重複直到 `l >= r`。

省下額外字串。

- **時間複雜度**：O(n)
- **空間複雜度**：O(1)

## 範例追蹤（最佳解）

```
s = "A man, a plan, a canal: Panama"

l=0  ('A') r=29 ('a') → match (a==a) → l=1, r=28
l=1  (' ') 跳過 → l=2 ('m') r=28 ('m') → match → l=3, r=27
... 持續跳過標點與空格 ...
最終 l >= r → true ✓
```

## 關鍵點 / 易錯陷阱

- 「英數字」包含字母與數字（不只是字母）。
- 大小寫不敏感（記得轉 lower）。
- 空字串或全為標點的字串視為回文。
- 雙指標跳過時注意 `l < r` 邊界，避免越界。
