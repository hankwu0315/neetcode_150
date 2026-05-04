"""
Problem: 0684. Redundant Connection
Difficulty: Medium
URL: https://leetcode.com/problems/redundant-connection/

解法：Union-Find。
"""
from __future__ import annotations
from typing import List


class Solution:
    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:
        n = len(edges)
        parent = list(range(n + 1))

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        for a, b in edges:
            ra, rb = find(a), find(b)
            if ra == rb:
                return [a, b]
            parent[ra] = rb
        return []


if __name__ == "__main__":
    sol = Solution()
    assert sol.findRedundantConnection([[1, 2], [1, 3], [2, 3]]) == [2, 3]
    assert sol.findRedundantConnection(
        [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
    ) == [1, 4]
    assert sol.findRedundantConnection([[1, 2], [2, 3], [3, 1]]) == [3, 1]
    assert sol.findRedundantConnection([[2, 1], [3, 1], [4, 2], [1, 4]]) == [1, 4]
    assert sol.findRedundantConnection([[1, 2], [1, 3], [3, 2]]) == [3, 2]
    print("All tests passed!")
