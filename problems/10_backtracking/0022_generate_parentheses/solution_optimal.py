"""
Problem: 0022. Generate Parentheses
Difficulty: Medium
URL: https://leetcode.com/problems/generate-parentheses/

解法：回溯，維護 open/close 計數。
"""
from __future__ import annotations
from typing import List


class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        out: List[str] = []
        path: List[str] = []

        def dfs(op: int, cl: int) -> None:
            if op == n and cl == n:
                out.append(''.join(path))
                return
            if op < n:
                path.append('(')
                dfs(op + 1, cl)
                path.pop()
            if cl < op:
                path.append(')')
                dfs(op, cl + 1)
                path.pop()

        dfs(0, 0)
        return out


if __name__ == "__main__":
    sol = Solution()
    assert sorted(sol.generateParenthesis(3)) == sorted(
        ["((()))", "(()())", "(())()", "()(())", "()()()"]
    )
    assert sol.generateParenthesis(1) == ["()"]
    assert sorted(sol.generateParenthesis(2)) == sorted(["(())", "()()"])
    assert len(sol.generateParenthesis(4)) == 14
    assert len(sol.generateParenthesis(5)) == 42
    print("All tests passed!")
