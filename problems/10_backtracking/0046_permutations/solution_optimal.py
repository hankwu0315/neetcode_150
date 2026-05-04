"""
Problem: 0046. Permutations
Difficulty: Medium
URL: https://leetcode.com/problems/permutations/

解法：回溯 + used 標記。
"""
from __future__ import annotations
from typing import List


class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        out: List[List[int]] = []
        path: List[int] = []
        used = [False] * n

        def dfs() -> None:
            if len(path) == n:
                out.append(path.copy())
                return
            for i in range(n):
                if used[i]: continue
                used[i] = True
                path.append(nums[i])
                dfs()
                path.pop()
                used[i] = False

        dfs()
        return out


def _norm(xs):
    return sorted(xs)


if __name__ == "__main__":
    sol = Solution()
    assert _norm(sol.permute([1, 2, 3])) == _norm(
        [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    )
    assert _norm(sol.permute([0, 1])) == _norm([[0, 1], [1, 0]])
    assert sol.permute([1]) == [[1]]
    assert len(sol.permute([1, 2, 3, 4])) == 24
    assert _norm(sol.permute([7, 8])) == _norm([[7, 8], [8, 7]])
    print("All tests passed!")
