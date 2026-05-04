"""
Problem: 0150. Evaluate Reverse Polish Notation
Difficulty: Medium
URL: https://leetcode.com/problems/evaluate-reverse-polish-notation/

解法演進：
1) 堆疊：數字 push；運算子 pop b, pop a, push (a op b)。
2) 除法以 int(a/b) 處理「向 0 截斷」（與 Python // 不同）。

最佳解核心思路：
- 後綴表示式的標準堆疊評估法。

複雜度：O(n) / O(n)。
"""

class Solution:
    def evalRPN(self, tokens: list[str]) -> int:
        pass

    def evalRPN_brute(self, tokens: list[str]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
