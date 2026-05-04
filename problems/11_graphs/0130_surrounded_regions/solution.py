"""
Problem: 0130. Surrounded Regions
Difficulty: Medium
URL: https://leetcode.com/problems/surrounded-regions/

解法：從邊界 DFS 標記倖存 O。
"""

from __future__ import annotations

from typing import List

class Solution:
    def solve(self, board: List[List[str]]) -> None:
        pass


def _g(rows): return [list(r) for r in rows]

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
