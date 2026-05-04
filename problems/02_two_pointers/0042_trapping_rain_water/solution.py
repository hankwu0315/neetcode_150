"""
Problem: 42. Trapping Rain Water
Difficulty: Hard
URL: https://leetcode.com/problems/trapping-rain-water/

【解法演進】暴力 O(n²) → 前綴後綴最大值 O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
【最佳解核心思路】
    維護 l, r, lMax, rMax；何側較矮便結算何側水量並更新。
【複雜度】時間：O(n)  空間：O(1)
"""

from typing import List

class Solution:
    # 最佳解：雙指標
    def trap(self, height: List[int]) -> int:
        pass

    def trap_arrays(self, height: List[int]) -> int:
        pass

    def trap_brute(self, height: List[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
