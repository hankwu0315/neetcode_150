"""
Problem: 0090. Subsets II
Difficulty: Medium
URL: https://leetcode.com/problems/subsets-ii/

解法：排序 + 回溯，同層去重 (j>i and nums[j]==nums[j-1])。
"""
from __future__ import annotations
from typing import List


class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        a = sorted(nums)
        n = len(a)
        out: List[List[int]] = []
        path: List[int] = []

        def dfs(i: int) -> None:
            out.append(path.copy())
            for j in range(i, n):
                if j > i and a[j] == a[j - 1]:
                    continue
                path.append(a[j])
                dfs(j + 1)
                path.pop()

        dfs(0)
        return out


def _norm(xs):
    return sorted([sorted(s) for s in xs])


if __name__ == "__main__":
    sol = Solution()
    assert _norm(sol.subsetsWithDup([1, 2, 2])) == _norm(
        [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]
    )
    assert _norm(sol.subsetsWithDup([0])) == _norm([[], [0]])
    assert _norm(sol.subsetsWithDup([4, 4, 4, 1, 4])) == _norm(
        [[], [1], [4], [1, 4], [4, 4], [1, 4, 4], [4, 4, 4], [1, 4, 4, 4], [4, 4, 4, 4], [1, 4, 4, 4, 4]]
    )
    assert _norm(sol.subsetsWithDup([])) == [[]]
    assert _norm(sol.subsetsWithDup([1, 1])) == _norm([[], [1], [1, 1]])
    print("All tests passed!")
