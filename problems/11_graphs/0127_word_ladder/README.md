# 0127. Word Ladder

- 難度：Hard
- LeetCode：https://leetcode.com/problems/word-ladder/

## 題目描述（中文）

從 `beginWord` 變到 `endWord`，每步只能改 1 個字母且需在 `wordList` 中。回傳最短轉換序列長度（含起點與終點）；不可達回 0。

## 範例 / 限制

- `beginWord="hit", endWord="cog", wordList=["hot","dot","dog","lot","log","cog"]` → 5

## 解法

### 解法（BFS + 模式 *）

把每個字 `s` 對應 L 個模式 `s[:i]+'*'+s[i+1:]` 建立桶。BFS 從 beginWord 出發，透過共享模式找鄰居；首個達 endWord 的層數即答案。

時間 O(N·L²)，空間 O(N·L)。

## 關鍵點 / 易錯陷阱

- endWord 不在 wordList 即不可達。
- 用過的桶清空避免重複展開。
