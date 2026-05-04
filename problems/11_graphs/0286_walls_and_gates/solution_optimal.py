"""
Problem: 0286. Walls and Gates
Difficulty: Medium
URL: https://leetcode.com/problems/walls-and-gates/

解法：多源 BFS，從所有門出發。
"""
from __future__ import annotations
from typing import List
from collections import deque

INF = 2147483647


class Solution:
    def wallsAndGates(self, rooms: List[List[int]]) -> None:
        if not rooms or not rooms[0]: return
        m, n = len(rooms), len(rooms[0])
        q = deque()
        for i in range(m):
            for j in range(n):
                if rooms[i][j] == 0:
                    q.append((i, j))
        dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        while q:
            i, j = q.popleft()
            for di, dj in dirs:
                ni, nj = i + di, j + dj
                if 0 <= ni < m and 0 <= nj < n and rooms[ni][nj] == INF:
                    rooms[ni][nj] = rooms[i][j] + 1
                    q.append((ni, nj))


if __name__ == "__main__":
    sol = Solution()
    rooms = [
        [INF, -1, 0, INF],
        [INF, INF, INF, -1],
        [INF, -1, INF, -1],
        [0, -1, INF, INF],
    ]
    sol.wallsAndGates(rooms)
    assert rooms == [
        [3, -1, 0, 1],
        [2, 2, 1, -1],
        [1, -1, 2, -1],
        [0, -1, 3, 4],
    ]
    r2 = [[0]]
    sol.wallsAndGates(r2)
    assert r2 == [[0]]
    r3 = [[INF]]
    sol.wallsAndGates(r3)
    assert r3 == [[INF]]
    r4 = [[-1, INF, 0]]
    sol.wallsAndGates(r4)
    assert r4 == [[-1, 1, 0]]
    r5 = []
    sol.wallsAndGates(r5)
    assert r5 == []
    print("All tests passed!")
