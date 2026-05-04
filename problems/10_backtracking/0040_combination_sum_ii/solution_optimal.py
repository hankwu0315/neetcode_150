"""
Problem: 0040. Combination Sum II
Difficulty: Medium
URL: https://leetcode.com/problems/combination-sum-ii/

解法：排序 + 回溯，同層去重 (j>i and c[j]==c[j-1])，下一層 j+1。
"""
from __future__ import annotations
from typing import List


class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        c = sorted(candidates)
        out: List[List[int]] = []
        path: List[int] = []
        n = len(c)

        def dfs(i: int, remain: int) -> None:
            if remain == 0:
                out.append(path.copy())
                return
            for j in range(i, n):
                if j > i and c[j] == c[j - 1]:
                    continue
                if c[j] > remain:
                    break
                path.append(c[j])
                dfs(j + 1, remain - c[j])
                path.pop()

        dfs(0, target)
        return out


def _norm(xs):
    return sorted([sorted(s) for s in xs])


if __name__ == "__main__":
    sol = Solution()
    assert _norm(sol.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8)) == _norm(
        [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]
    )
    assert _norm(sol.combinationSum2([2, 5, 2, 1, 2], 5)) == _norm([[1, 2, 2], [5]])
    assert sol.combinationSum2([1, 1, 1], 5) == []
    assert _norm(sol.combinationSum2([1, 1, 1], 2)) == _norm([[1, 1]])
    assert _norm(sol.combinationSum2([4, 4, 2, 1, 4, 2, 2, 1, 3], 6)) == _norm(
        [[1, 1, 4], [1, 2, 3], [2, 4], [2, 2, 2], [1, 1, 2, 2]]
    )
    print("All tests passed!")
