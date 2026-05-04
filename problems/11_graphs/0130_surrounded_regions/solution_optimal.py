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
        if not board or not board[0]: return
        m, n = len(board), len(board[0])

        def dfs(i: int, j: int) -> None:
            if i < 0 or i >= m or j < 0 or j >= n or board[i][j] != 'O':
                return
            board[i][j] = '#'
            dfs(i + 1, j); dfs(i - 1, j); dfs(i, j + 1); dfs(i, j - 1)

        for i in range(m):
            dfs(i, 0); dfs(i, n - 1)
        for j in range(n):
            dfs(0, j); dfs(m - 1, j)
        for i in range(m):
            for j in range(n):
                if board[i][j] == 'O':
                    board[i][j] = 'X'
                elif board[i][j] == '#':
                    board[i][j] = 'O'


def _g(rows): return [list(r) for r in rows]


if __name__ == "__main__":
    sol = Solution()
    b = _g(["XXXX", "XOOX", "XXOX", "XOXX"])
    sol.solve(b)
    assert b == _g(["XXXX", "XXXX", "XXXX", "XOXX"])
    b2 = _g(["X"])
    sol.solve(b2)
    assert b2 == _g(["X"])
    b3 = _g(["OO", "OO"])
    sol.solve(b3)
    assert b3 == _g(["OO", "OO"])
    b4 = _g(["XXX", "XOX", "XXX"])
    sol.solve(b4)
    assert b4 == _g(["XXX", "XXX", "XXX"])
    b5 = _g(["OXXO", "XOOX", "XOOX", "OXXO"])
    sol.solve(b5)
    assert b5 == _g(["OXXO", "XXXX", "XXXX", "OXXO"])
    print("All tests passed!")
