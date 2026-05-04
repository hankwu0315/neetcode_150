"""
Problem: 0040. Combination Sum II
Difficulty: Medium
URL: https://leetcode.com/problems/combination-sum-ii/

解法：排序 + 回溯，同層去重 (j>i and c[j]==c[j-1])，下一層 j+1。
"""

from __future__ import annotations

from typing import List

class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        pass


def _norm(xs):
    return sorted([sorted(s) for s in xs])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
