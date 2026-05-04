"""
Problem: 0078. Subsets
Difficulty: Medium
URL: https://leetcode.com/problems/subsets/

解法：回溯選或不選；時間 O(N*2^N)，空間 O(N)。
"""
from __future__ import annotations
from typing import List


class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        out: List[List[int]] = []
        path: List[int] = []
        n = len(nums)

        def dfs(i: int) -> None:
            if i == n:
                out.append(path.copy())
                return
            dfs(i + 1)
            path.append(nums[i])
            dfs(i + 1)
            path.pop()

        dfs(0)
        return out


def _norm(xs):
    return sorted([sorted(s) for s in xs])


if __name__ == "__main__":
    sol = Solution()
    assert _norm(sol.subsets([1, 2, 3])) == _norm(
        [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
    )
    assert _norm(sol.subsets([0])) == [[], [0]]
    assert _norm(sol.subsets([])) == [[]]
    assert len(sol.subsets([1, 2, 3, 4])) == 16
    assert _norm(sol.subsets([5, 6])) == _norm([[], [5], [6], [5, 6]])
    print("All tests passed!")
