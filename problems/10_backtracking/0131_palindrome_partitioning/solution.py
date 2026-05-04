"""
Problem: 0131. Palindrome Partitioning
Difficulty: Medium
URL: https://leetcode.com/problems/palindrome-partitioning/

解法：回溯 + 雙指針回文檢查。
"""

from __future__ import annotations

from typing import List

class Solution:
    def partition(self, s: str) -> List[List[str]]:
        pass


def _norm(xs):
    return sorted([list(s) for s in xs])

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
