"""
Problem: 0994. Rotting Oranges
Difficulty: Medium
URL: https://leetcode.com/problems/rotting-oranges/

解法：多源 BFS。
"""
from __future__ import annotations
from typing import List
from collections import deque


class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        if not grid or not grid[0]: return 0
        m, n = len(grid), len(grid[0])
        q = deque()
        fresh = 0
        for i in range(m):
            for j in range(n):
                if grid[i][j] == 2:
                    q.append((i, j))
                elif grid[i][j] == 1:
                    fresh += 1
        if fresh == 0:
            return 0
        mins = 0
        dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        while q:
            spread = False
            for _ in range(len(q)):
                i, j = q.popleft()
                for di, dj in dirs:
                    ni, nj = i + di, j + dj
                    if 0 <= ni < m and 0 <= nj < n and grid[ni][nj] == 1:
                        grid[ni][nj] = 2
                        fresh -= 1
                        q.append((ni, nj))
                        spread = True
            if spread:
                mins += 1
        return mins if fresh == 0 else -1


def _g(rows): return [list(r) for r in rows]


if __name__ == "__main__":
    sol = Solution()
    assert sol.orangesRotting([[2, 1, 1], [1, 1, 0], [0, 1, 1]]) == 4
    assert sol.orangesRotting([[2, 1, 1], [0, 1, 1], [1, 0, 1]]) == -1
    assert sol.orangesRotting([[0, 2]]) == 0
    assert sol.orangesRotting([[0]]) == 0
    assert sol.orangesRotting([[1]]) == -1
    assert sol.orangesRotting([[2, 2], [1, 1], [0, 0], [2, 0]]) == 1
    print("All tests passed!")
