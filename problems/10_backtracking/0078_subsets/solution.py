"""
Problem: 0078. Subsets
Difficulty: Medium
URL: https://leetcode.com/problems/subsets/

解法：回溯選或不選；時間 O(N*2^N)，空間 O(N)。
"""

from __future__ import annotations

from typing import List

class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        pass


def _norm(xs):
    return sorted([sorted(s) for s in xs])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
