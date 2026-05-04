"""
Problem: 0046. Permutations
Difficulty: Medium
URL: https://leetcode.com/problems/permutations/

解法：回溯 + used 標記。
"""

from __future__ import annotations

from typing import List

class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        pass


def _norm(xs):
    return sorted(xs)

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
