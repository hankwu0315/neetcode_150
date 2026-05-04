# 271. Encode and Decode Strings 🔒

**Difficulty**: Medium  **URL**: https://leetcode.com/problems/encode-and-decode-strings/

> 🔒 LeetCode Premium 題目；可在 [NeetCode.io](https://neetcode.io/) 練習免費版。

## 題目描述（中文）

設計一個演算法，能將字串陣列**編碼**成單一字串，並能從這個字串**解碼**回原本的陣列。  
字串可能包含**任意 Unicode 字元**（包括分隔符），請設計能處理所有情況的編碼方式。

```
class Codec:
    def encode(self, strs: List[str]) -> str: ...
    def decode(self, s: str) -> List[str]: ...
```

## 範例 / 限制

**範例 1**
```
Input:  ["lint","code","love","you"]
Output: ["lint","code","love","you"]   （encode 後 decode 應相等）
```

**範例 2**
```
Input:  ["we", "say", ":", "yes"]
Output: ["we", "say", ":", "yes"]
```

**限制**
- `1 <= strs.length <= 200`
- `0 <= strs[i].length <= 200`
- 字串可能包含任意 256 種 ASCII 字元

## 解法

### 解法一：脆弱分隔符
用罕見字元（如 `\x00`）連接字串。
- **缺陷**：若字串本身含該字元就壞了，**無法處理任意輸入**。

### 最佳解：長度 + 分隔符（Length-Prefix Encoding）

**核心思路**：

**Encode**：對每個字串 `s`，輸出 `len(s) + '#' + s`。  
**Decode**：從位置 `i` 開始：
1. 找到下一個 `'#'` 的位置 `j`。
2. 取 `length = int(s[i:j])`。
3. 該字串為 `s[j+1 : j+1+length]`。
4. `i = j + 1 + length`，重複直到末端。

由於 `#` 之前必為純數字（長度），即使原字串包含 `#` 也不會混淆。

- **時間複雜度**：O(N)，N 為所有字元總數
- **空間複雜度**：O(N)（輸出字串）

## 範例追蹤（最佳解）

```
strs = ["lint", "code", "love", "you"]
encode → "4#lint4#code4#love3#you"

decode "4#lint4#code4#love3#you":
i=0, 找 '#' j=1, length=4, s="lint", i=6
i=6, 找 '#' j=7, length=4, s="code", i=12
i=12, 找 '#' j=13, length=4, s="love", i=18
i=18, 找 '#' j=19, length=3, s="you", i=23 → 結束

結果：["lint", "code", "love", "you"] ✓
```

## 關鍵點 / 易錯陷阱

- 必須能處理空字串（`encode([""]) = "0#"`）。
- 不能用單一字元當分隔，因字串可能含該字元。
- 長度前綴後的 `#` 只是「分隔長度與內文」，內文可任意。
- 別忘了 decode 後 `i` 要跳過 `#` 與長度字串。
