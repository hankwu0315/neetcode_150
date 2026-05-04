"""
Problem: 0051. N-Queens
Difficulty: Hard
URL: https://leetcode.com/problems/n-queens/

解法：回溯，三組 set（cols, r-c, r+c）。
"""
from __future__ import annotations
from typing import List


class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        out: List[List[str]] = []
        cols, d1, d2 = set(), set(), set()
        placed: List[int] = []  # placed[r] = col

        def dfs(r: int) -> None:
            if r == n:
                board = []
                for c in placed:
                    row = ['.'] * n
                    row[c] = 'Q'
                    board.append(''.join(row))
                out.append(board)
                return
            for c in range(n):
                if c in cols or (r - c) in d1 or (r + c) in d2:
                    continue
                cols.add(c); d1.add(r - c); d2.add(r + c)
                placed.append(c)
                dfs(r + 1)
                placed.pop()
                cols.remove(c); d1.remove(r - c); d2.remove(r + c)

        dfs(0)
        return out


if __name__ == "__main__":
    sol = Solution()
    r1 = sol.solveNQueens(1)
    assert r1 == [["Q"]]
    r4 = sol.solveNQueens(4)
    assert len(r4) == 2
    expected4 = sorted([
        [".Q..", "...Q", "Q...", "..Q."],
        ["..Q.", "Q...", "...Q", ".Q.."],
    ])
    assert sorted(r4) == expected4
    assert len(sol.solveNQueens(5)) == 10
    assert len(sol.solveNQueens(6)) == 4
    assert sol.solveNQueens(2) == []
    print("All tests passed!")
