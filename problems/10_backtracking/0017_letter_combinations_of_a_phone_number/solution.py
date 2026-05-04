"""
Problem: 0017. Letter Combinations of a Phone Number
Difficulty: Medium
URL: https://leetcode.com/problems/letter-combinations-of-a-phone-number/

解法：回溯。
"""
from __future__ import annotations
from typing import List


class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        if not digits:
            return []
        m = {
            '2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
            '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz',
        }
        out: List[str] = []
        path: List[str] = []
        n = len(digits)

        def dfs(i: int) -> None:
            if i == n:
                out.append(''.join(path))
                return
            for ch in m[digits[i]]:
                path.append(ch)
                dfs(i + 1)
                path.pop()

        dfs(0)
        return out


if __name__ == "__main__":
    sol = Solution()
    assert sorted(sol.letterCombinations("23")) == sorted(
        ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
    )
    assert sol.letterCombinations("") == []
    assert sol.letterCombinations("2") == ["a", "b", "c"]
    assert sorted(sol.letterCombinations("7")) == ["p", "q", "r", "s"]
    assert len(sol.letterCombinations("234")) == 27
    print("All tests passed!")
