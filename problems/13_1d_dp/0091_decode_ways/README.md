# 0091. Decode Ways

- 難度：Medium
- LeetCode：https://leetcode.com/problems/decode-ways/

## 題目描述（中文）

`'A'..'Z'` 對 `"1"..."26"`。給數字串求解碼方式數。

## 解法

DP：`dp[i] = (s[i-1]!='0' ? dp[i-1] : 0) + (10..26 包含兩位 ? dp[i-2] : 0)`。
