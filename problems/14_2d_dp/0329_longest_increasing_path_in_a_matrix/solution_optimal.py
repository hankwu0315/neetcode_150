"""
Problem: 0329. Longest Increasing Path in a Matrix
"""
from typing import List
import sys
sys.setrecursionlimit(100000)


class Solution:
    def longestIncreasingPath(self, matrix: List[List[int]]) -> int:
        if not matrix or not matrix[0]:
            return 0
        m, n = len(matrix), len(matrix[0])
        memo = [[0] * n for _ in range(m)]

        def dfs(i: int, j: int) -> int:
            if memo[i][j]:
                return memo[i][j]
            best = 1
            for di, dj in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                ni, nj = i + di, j + dj
                if 0 <= ni < m and 0 <= nj < n and matrix[ni][nj] > matrix[i][j]:
                    v = 1 + dfs(ni, nj)
                    if v > best:
                        best = v
            memo[i][j] = best
            return best

        ans = 0
        for i in range(m):
            for j in range(n):
                v = dfs(i, j)
                if v > ans:
                    ans = v
        return ans


if __name__ == "__main__":
    sol = Solution()
    assert sol.longestIncreasingPath([[9, 9, 4], [6, 6, 8], [2, 1, 1]]) == 4
    assert sol.longestIncreasingPath([[3, 4, 5], [3, 2, 6], [2, 2, 1]]) == 4
    assert sol.longestIncreasingPath([[1]]) == 1
    assert sol.longestIncreasingPath([[]]) == 0
    assert sol.longestIncreasingPath([[1, 2]]) == 2
    assert sol.longestIncreasingPath([[7, 7, 7], [7, 7, 7]]) == 1
    print("All tests passed!")
