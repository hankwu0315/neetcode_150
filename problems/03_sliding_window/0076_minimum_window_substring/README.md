# 76. Minimum Window Substring

**Difficulty**: Hard  **URL**: https://leetcode.com/problems/minimum-window-substring/

## 題目描述（中文）

給定字串 `s` 與 `t`，找出 `s` 中**最短**的子字串，使其包含 `t` 全部字元（含重複次數）。  
若不存在則回傳 `""`。

## 範例 / 限制

**範例 1**
```
Input:  s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
```

**範例 2**
```
Input:  s = "a", t = "a"
Output: "a"
```

**範例 3**
```
Input:  s = "a", t = "aa"
Output: ""    (s 不夠多 'a')
```

**限制**
- `1 <= s.length, t.length <= 10⁵`
- 含大小寫英文字母

## 解法

### 暴力解：枚舉所有子字串
對每個 (l, r) 檢查是否覆蓋 `t`。
- **時間複雜度**：O(n² · |Σ|)
- **空間複雜度**：O(|Σ|)

### 最佳解：滑動窗口 + 「滿足字元」計數

**核心思路**：

1. 計算 `need = Counter(t)`，`required = len(need)` 是不同字元數。
2. 維護窗口 `[l, r]`、計數 `window`、`have = 滿足 need[c] 條件的字元種類數`。
3. 右指標 `r` 不斷擴張：
   - `window[s[r]] += 1`；
   - 若 `s[r] in need 且 window[s[r]] == need[s[r]]`：`have += 1`。
4. 當 `have == required` 時嘗試縮左：
   - 紀錄目前最小窗口（位置與長度）；
   - `window[s[l]] -= 1`；
   - 若 `s[l] in need 且 window[s[l]] < need[s[l]]`：`have -= 1`；
   - `l += 1`，繼續直到不再滿足。
5. 結束後回傳最小窗口字串。

每字元至多被左右指標各處理一次。

- **時間複雜度**：O(|s| + |t|)
- **空間複雜度**：O(|Σ|)

## 範例追蹤（最佳解）

```
s = "ADOBECODEBANC", t = "ABC"
need = {A:1, B:1, C:1}, required = 3

擴張到 r=5: 'ADOBEC' → window 含 A:1, B:1, C:1, have=3
縮 l: l=0 'A' 移除 → window[A]=0 < need[A] → have=2, l=1
擴張到 r=10: 'DOBECODEBA' → 補齊 A → have=3, 紀錄窗口
... 持續直到 r=12 'C':
  s[5..12] = "CODEBANC" 長 8
  繼續縮: 'O' 不在 need → l=6; 'D' 不在 → l=7; 'E' 不在 → l=8; 'B' 移除 → have=2, l=9
最小：r=12, l=9 → s[9..12] = "BANC" 長 4 ✓
```

## 關鍵點 / 易錯陷阱

- `have` 只在「正好等於 `need[c]`」時才 +1（多了不算）。
- 縮左指標時也是「剛好低於 `need[c]`」才 -1，避免錯誤計數。
- 注意 `t` 可能含重複字元。
- 邊界：若 `len(s) < len(t)` 直接回傳 `""`。
