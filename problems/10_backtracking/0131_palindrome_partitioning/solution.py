"""
Problem: 0131. Palindrome Partitioning
Difficulty: Medium
URL: https://leetcode.com/problems/palindrome-partitioning/

解法：回溯 + 雙指針回文檢查。
"""
from __future__ import annotations
from typing import List


class Solution:
    def partition(self, s: str) -> List[List[str]]:
        n = len(s)
        out: List[List[str]] = []
        path: List[str] = []

        def isPal(l: int, r: int) -> bool:
            while l < r:
                if s[l] != s[r]: return False
                l += 1; r -= 1
            return True

        def dfs(start: int) -> None:
            if start == n:
                out.append(path.copy())
                return
            for end in range(start, n):
                if isPal(start, end):
                    path.append(s[start:end + 1])
                    dfs(end + 1)
                    path.pop()

        dfs(0)
        return out


def _norm(xs):
    return sorted([list(s) for s in xs])


if __name__ == "__main__":
    sol = Solution()
    assert _norm(sol.partition("aab")) == _norm([["a", "a", "b"], ["aa", "b"]])
    assert _norm(sol.partition("a")) == [["a"]]
    assert _norm(sol.partition("aa")) == _norm([["a", "a"], ["aa"]])
    assert _norm(sol.partition("aba")) == _norm([["a", "b", "a"], ["aba"]])
    assert len(sol.partition("efe")) == 2
    print("All tests passed!")
