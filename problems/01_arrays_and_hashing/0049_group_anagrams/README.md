# 49. Group Anagrams

**Difficulty**: Medium  **URL**: https://leetcode.com/problems/group-anagrams/

## 題目描述（中文）

給定一個字串陣列 `strs`，將所有為彼此**字母異位詞**（anagram）的字串分組。  
返回的群組順序與群內字串順序皆無要求。

## 範例 / 限制

**範例 1**
```
Input:  strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
```

**範例 2**
```
Input:  strs = [""]
Output: [[""]]
```

**範例 3**
```
Input:  strs = ["a"]
Output: [["a"]]
```

**限制**
- `1 <= strs.length <= 10⁴`
- `0 <= strs[i].length <= 100`
- `strs[i]` 由英文小寫字母組成

## 解法

### 解法一：排序作為 key
將每個字串字元排序後當作 dict 的 key，把原字串歸類到該 key 下。
- **時間複雜度**：O(n · k log k)，n 為字串數，k 為平均字串長度
- **空間複雜度**：O(n · k)

### 最佳解：26 元組計數作為 key

**核心思路**：
1. 對每個字串，建立長度 26 的計數陣列 `count`，紀錄各字母出現次數。
2. 將 `tuple(count)` 作為 dict 的 key（list 不可雜湊，故轉 tuple）。
3. 把字串放入對應 group。
4. 最後回傳所有 groups。

避免排序，每字串成本由 O(k log k) 降為 O(k)。

- **時間複雜度**：O(n · k)
- **空間複雜度**：O(n · k)

## 範例追蹤（最佳解）

```
strs = ["eat","tea","tan","ate","nat","bat"]

"eat" → count(a:1,e:1,t:1) → key=(1,0,0,0,1,...,1,0,...) → groups[key] = ["eat"]
"tea" → 同 key → ["eat","tea"]
"tan" → count(a:1,n:1,t:1) → 新 key → ["tan"]
"ate" → 同 "eat" key → ["eat","tea","ate"]
"nat" → 同 "tan" key → ["tan","nat"]
"bat" → 新 key → ["bat"]

結果（順序不限）：[["eat","tea","ate"], ["tan","nat"], ["bat"]] ✓
```

## 關鍵點 / 易錯陷阱

- list 不可雜湊：必須轉 tuple 才能當 dict key。
- 26 元組計數需保留**順序**（每個位置代表固定字母），不要排序。
- 若是 Unicode：改用 `frozenset(Counter().items())` 或排序字串。
- 排序 key 雖然慢一點但程式碼最短。
