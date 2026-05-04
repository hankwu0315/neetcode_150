"""
Problem: 0079. Word Search
Difficulty: Medium
URL: https://leetcode.com/problems/word-search/

解法：回溯，原地塗銷避免重複用格。
"""
from __future__ import annotations
from typing import List


class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        m, n = len(board), len(board[0])
        L = len(word)

        def dfs(i: int, j: int, k: int) -> bool:
            if k == L:
                return True
            if i < 0 or i >= m or j < 0 or j >= n or board[i][j] != word[k]:
                return False
            tmp = board[i][j]
            board[i][j] = '#'
            ok = (dfs(i + 1, j, k + 1) or dfs(i - 1, j, k + 1)
                  or dfs(i, j + 1, k + 1) or dfs(i, j - 1, k + 1))
            board[i][j] = tmp
            return ok

        for i in range(m):
            for j in range(n):
                if board[i][j] == word[0] and dfs(i, j, 0):
                    return True
        return False


if __name__ == "__main__":
    sol = Solution()
    b1 = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
    assert sol.exist([row[:] for row in b1], "ABCCED") is True
    assert sol.exist([row[:] for row in b1], "SEE") is True
    assert sol.exist([row[:] for row in b1], "ABCB") is False
    assert sol.exist([["A"]], "A") is True
    assert sol.exist([["A"]], "B") is False
    print("All tests passed!")
