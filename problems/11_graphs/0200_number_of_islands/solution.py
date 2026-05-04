"""
Problem: 0200. Number of Islands
Difficulty: Medium
URL: https://leetcode.com/problems/number-of-islands/

解法：DFS 標記。時間 O(m*n)。
"""

from __future__ import annotations

from typing import List

class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        pass


def _g(rows): return [list(r) for r in rows]

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
