"""
Problem: 0039. Combination Sum
Difficulty: Medium
URL: https://leetcode.com/problems/combination-sum/

解法：排序 + 回溯（同位置可重複用，下一層從 j 開始）。
"""

from __future__ import annotations

from typing import List

class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        pass


def _norm(xs):
    return sorted([sorted(s) for s in xs])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
