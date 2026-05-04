"""
Problem: 11. Container With Most Water
Difficulty: Medium
URL: https://leetcode.com/problems/container-with-most-water/

【解法演進】暴力雙重迴圈 O(n²) → 雙指標相向 O(n)（最佳）
【最佳解核心思路】
    左右指標相向收斂，每次移動較矮的一側，因為較高側若移動只會雙輸。
【複雜度】時間：O(n)  空間：O(1)
"""

from typing import List

class Solution:
    # 最佳解：雙指標
    def maxArea(self, height: List[int]) -> int:
        pass

    def maxArea_brute(self, height: List[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
