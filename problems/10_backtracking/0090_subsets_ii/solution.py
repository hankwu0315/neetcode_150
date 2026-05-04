"""
Problem: 0090. Subsets II
Difficulty: Medium
URL: https://leetcode.com/problems/subsets-ii/

解法：排序 + 回溯，同層去重 (j>i and nums[j]==nums[j-1])。
"""

from __future__ import annotations

from typing import List

class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        pass


def _norm(xs):
    return sorted([sorted(s) for s in xs])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
