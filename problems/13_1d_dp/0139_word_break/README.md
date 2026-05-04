# 0139. Word Break

- 難度：Medium
- LeetCode：https://leetcode.com/problems/word-break/

## 題目描述（中文）

`s` 能否被切分為字典 `wordDict` 中單字的連接（可重複）。

## 解法

DP：`dp[i]` 表示 `s[:i]` 可拼。`dp[i] = any(dp[j] && s[j:i] in set, 0<=j<i)`。
