"""
Problem: 0417. Pacific Atlantic Water Flow
Difficulty: Medium
URL: https://leetcode.com/problems/pacific-atlantic-water-flow/

解法：從兩洋邊界反向 DFS。
"""

from __future__ import annotations

from typing import List

class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        pass


def _normalize(arr): return sorted(tuple(x) for x in arr)

if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
