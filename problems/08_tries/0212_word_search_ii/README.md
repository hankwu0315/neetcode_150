# 0212. Word Search II

- 難度：Hard
- LeetCode：https://leetcode.com/problems/word-search-ii/

## 題目描述（中文）

m×n 字母板與 words 列表。回傳所有可在板上連通（上下左右、不可重複使用同格）拼出的 words。

## 範例 / 限制

- `board=[['o','a','a','n'],['e','t','a','e'],['i','h','k','r'],['i','f','l','v']], words=["oath","pea","eat","rain"]` → `["oath","eat"]`
- 1 ≤ m,n ≤ 12；words 數量 ≤ 3×10^4；單字長度 ≤ 10。

## 解法

### 解法（最佳解）：Trie + DFS（多單字共享前綴）

把所有 words 建 Trie。從每格起點 DFS：
- 當前 cell 字母不在 trie 子節點 → 剪枝。
- 命中 `end`：把 word 加入結果，並把該 trie 節點的 `word` 設 None（或用 hash set 避免重複）。
- 標記 cell 已訪問（暫時改成 `#`）。
- 結束時可剪掉葉節點（DFS 回傳後若該 trie 子節點無子，移除以加速）。
- 時間：O(M × 4 × 3^(L-1))，M 為格數、L 為最長單字
- 空間：O(N × L)（trie 大小）

## 關鍵點 / 易錯陷阱

- 多 word 共用 trie 是關鍵；逐字搜尋 + 字典 set 在 worst case 太慢。
- 結果不重複；找到後把 trie 節點 word 清空。
- 回溯記得復原 cell 標記。
