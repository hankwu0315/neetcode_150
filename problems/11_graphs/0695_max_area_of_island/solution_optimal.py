"""
Problem: 0695. Max Area of Island
Difficulty: Medium
URL: https://leetcode.com/problems/max-area-of-island/

解法：DFS 計面積。
"""
from __future__ import annotations
from typing import List


class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        if not grid or not grid[0]: return 0
        m, n = len(grid), len(grid[0])

        def dfs(i: int, j: int) -> int:
            if i < 0 or i >= m or j < 0 or j >= n or grid[i][j] != 1:
                return 0
            grid[i][j] = 0
            return 1 + dfs(i + 1, j) + dfs(i - 1, j) + dfs(i, j + 1) + dfs(i, j - 1)

        best = 0
        for i in range(m):
            for j in range(n):
                if grid[i][j] == 1:
                    best = max(best, dfs(i, j))
        return best


if __name__ == "__main__":
    sol = Solution()
    g1 = [
        [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
        [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
    ]
    assert sol.maxAreaOfIsland([row[:] for row in g1]) == 6
    assert sol.maxAreaOfIsland([[0, 0, 0, 0, 0, 0, 0, 0]]) == 0
    assert sol.maxAreaOfIsland([[1]]) == 1
    assert sol.maxAreaOfIsland([[1, 1], [1, 1]]) == 4
    assert sol.maxAreaOfIsland([[0, 1, 0], [1, 1, 1], [0, 1, 0]]) == 5
    print("All tests passed!")
