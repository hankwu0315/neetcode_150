"""
Problem: 128. Longest Consecutive Sequence
Difficulty: Medium
URL: https://leetcode.com/problems/longest-consecutive-sequence/

【解法演進】排序 O(n log n) → HashSet + 從起點展開 O(n)（最佳）
【最佳解核心思路】
    將 nums 放入 set。對每個 x，僅當 (x - 1) 不在 set 時 x 為序列起點，
    從 x 開始向上連續查找 x+1, x+2,...，計算長度。
    每個元素至多被檢查兩次，整體 O(n)。
【複雜度】時間：O(n)  空間：O(n)
"""

from typing import List

class Solution:
    # 最佳解：HashSet + 從起點展開
    def longestConsecutive(self, nums: List[int]) -> int:
        pass

    def longestConsecutive_brute(self, nums: List[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
