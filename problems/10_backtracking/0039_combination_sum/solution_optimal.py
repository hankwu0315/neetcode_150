"""
Problem: 0039. Combination Sum
Difficulty: Medium
URL: https://leetcode.com/problems/combination-sum/

解法：排序 + 回溯（同位置可重複用，下一層從 j 開始）。
"""
from __future__ import annotations
from typing import List


class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        c = sorted(candidates)
        out: List[List[int]] = []
        path: List[int] = []

        def dfs(i: int, remain: int) -> None:
            if remain == 0:
                out.append(path.copy())
                return
            for j in range(i, len(c)):
                if c[j] > remain: break
                path.append(c[j])
                dfs(j, remain - c[j])
                path.pop()

        dfs(0, target)
        return out


def _norm(xs):
    return sorted([sorted(s) for s in xs])


if __name__ == "__main__":
    sol = Solution()
    assert _norm(sol.combinationSum([2, 3, 6, 7], 7)) == _norm([[2, 2, 3], [7]])
    assert _norm(sol.combinationSum([2, 3, 5], 8)) == _norm([[2, 2, 2, 2], [2, 3, 3], [3, 5]])
    assert sol.combinationSum([2], 1) == []
    assert _norm(sol.combinationSum([1], 2)) == _norm([[1, 1]])
    assert _norm(sol.combinationSum([8, 7, 4, 3], 11)) == _norm([[3, 4, 4], [3, 8], [4, 7], [3, 3, 3, 2]] if False else [[3, 4, 4], [3, 8], [4, 7]])
    print("All tests passed!")
