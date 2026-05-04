"""
Problem: 0778. Swim in Rising Water
Difficulty: Hard
URL: https://leetcode.com/problems/swim-in-rising-water/

解法：Dijkstra（min-max）。
"""
from __future__ import annotations
from typing import List
import heapq


class Solution:
    def swimInWater(self, grid: List[List[int]]) -> int:
        n = len(grid)
        visited = [[False] * n for _ in range(n)]
        h = [(grid[0][0], 0, 0)]
        while h:
            t, i, j = heapq.heappop(h)
            if i == n - 1 and j == n - 1:
                return t
            if visited[i][j]:
                continue
            visited[i][j] = True
            for di, dj in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                ni, nj = i + di, j + dj
                if 0 <= ni < n and 0 <= nj < n and not visited[ni][nj]:
                    heapq.heappush(h, (max(t, grid[ni][nj]), ni, nj))
        return -1


if __name__ == "__main__":
    sol = Solution()
    assert sol.swimInWater([[0, 2], [1, 3]]) == 3
    assert sol.swimInWater([
        [0, 1, 2, 3, 4],
        [24, 23, 22, 21, 5],
        [12, 13, 14, 15, 16],
        [11, 17, 18, 19, 20],
        [10, 9, 8, 7, 6],
    ]) == 16
    assert sol.swimInWater([[0]]) == 0
    assert sol.swimInWater([[0, 1], [2, 3]]) == 3
    assert sol.swimInWater([[3, 2], [0, 1]]) == 3
    assert sol.swimInWater([[10, 12], [20, 15]]) == 15
    print("All tests passed!")
