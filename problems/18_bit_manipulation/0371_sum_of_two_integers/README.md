# 0371. Sum of Two Integers

- 難度：Medium
- LeetCode：https://leetcode.com/problems/sum-of-two-integers/

## 解法

不用 + 與 -：sum = a XOR b、carry = (a AND b) << 1，迭代直至 carry 為 0。
