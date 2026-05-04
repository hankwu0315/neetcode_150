"""
Problem: 0020. Valid Parentheses
Difficulty: Easy
URL: https://leetcode.com/problems/valid-parentheses/

解法演進：
1) 暴力：反覆移除相鄰配對 "()"、"[]"、"{}"，直到字串不變。O(n^2)。
2) 最佳：堆疊。左括號 push；右括號比對 top；結尾堆疊需空。O(n)。

最佳解核心思路：
- 用 dict 對應右→左括號，用堆疊維護尚未關閉的左括號。

複雜度：時間 O(n)，空間 O(n)。
"""

class Solution:
    # 最佳解：堆疊 O(n) / O(n)
    def isValid(self, s: str) -> bool:
        pass

    def isValid_brute(self, s: str) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
