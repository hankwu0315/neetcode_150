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
        if not heights or not heights[0]:
            return []
        m, n = len(heights), len(heights[0])
        pac = [[False] * n for _ in range(m)]
        atl = [[False] * n for _ in range(m)]

        def dfs(i: int, j: int, vis: List[List[bool]]) -> None:
            vis[i][j] = True
            for di, dj in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                ni, nj = i + di, j + dj
                if (
                    0 <= ni < m and 0 <= nj < n
                    and not vis[ni][nj]
                    and heights[ni][nj] >= heights[i][j]
                ):
                    dfs(ni, nj, vis)

        for i in range(m):
            dfs(i, 0, pac)
            dfs(i, n - 1, atl)
        for j in range(n):
            dfs(0, j, pac)
            dfs(m - 1, j, atl)
        return [[i, j] for i in range(m) for j in range(n) if pac[i][j] and atl[i][j]]


def _normalize(arr): return sorted(tuple(x) for x in arr)


if __name__ == "__main__":
    sol = Solution()
    h1 = [
        [1, 2, 2, 3, 5],
        [3, 2, 3, 4, 4],
        [2, 4, 5, 3, 1],
        [6, 7, 1, 4, 5],
        [5, 1, 1, 2, 4],
    ]
    expected1 = [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]]
    assert _normalize(sol.pacificAtlantic(h1)) == _normalize(expected1)
    assert sol.pacificAtlantic([[1]]) == [[0, 0]]
    assert _normalize(sol.pacificAtlantic([[1, 1], [1, 1]])) == _normalize(
        [[0, 0], [0, 1], [1, 0], [1, 1]]
    )
    assert sol.pacificAtlantic([]) == []
    h2 = [[3, 3, 3], [3, 1, 3], [0, 3, 3]]
    expected2 = [[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]]
    assert _normalize(sol.pacificAtlantic(h2)) == _normalize(expected2)
    print("All tests passed!")
