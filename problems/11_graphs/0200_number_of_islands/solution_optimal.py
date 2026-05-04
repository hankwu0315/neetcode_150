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
        if not grid or not grid[0]: return 0
        m, n = len(grid), len(grid[0])

        def dfs(i: int, j: int) -> None:
            if i < 0 or i >= m or j < 0 or j >= n or grid[i][j] != '1':
                return
            grid[i][j] = '0'
            dfs(i + 1, j); dfs(i - 1, j); dfs(i, j + 1); dfs(i, j - 1)

        cnt = 0
        for i in range(m):
            for j in range(n):
                if grid[i][j] == '1':
                    cnt += 1
                    dfs(i, j)
        return cnt


def _g(rows): return [list(r) for r in rows]


if __name__ == "__main__":
    sol = Solution()
    assert sol.numIslands(_g(["110", "100", "001"])) == 2
    assert sol.numIslands(_g(["11110", "11010", "11000", "00000"])) == 1
    assert sol.numIslands(_g(["11000", "11000", "00100", "00011"])) == 3
    assert sol.numIslands([]) == 0
    assert sol.numIslands(_g(["0"])) == 0
    assert sol.numIslands(_g(["1"])) == 1
    print("All tests passed!")
