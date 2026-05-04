"""
Problem: 242. Valid Anagram
Difficulty: Easy
URL: https://leetcode.com/problems/valid-anagram/

【解法演進】排序比較 O(n log n) → 計數陣列/字典 O(n)（最佳）
【最佳解核心思路】
    s 計數 +1、t 計數 -1，最後檢查全為 0；長度不同直接 False。
【複雜度】時間：O(n)  空間：O(1)（固定 26 槽）；Unicode 則 O(k)
"""

from collections import Counter

class Solution:
    # 最佳解：計數陣列
    def isAnagram(self, s: str, t: str) -> bool:
        pass

    def isAnagram_counter(self, s: str, t: str) -> bool:
        pass

    def isAnagram_brute(self, s: str, t: str) -> bool:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
