"""
Problem: 0261. Graph Valid Tree
Difficulty: Medium
URL: https://leetcode.com/problems/graph-valid-tree/

解法：Union-Find。
"""
from __future__ import annotations
from typing import List


class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        if len(edges) != n - 1:
            return False
        parent = list(range(n))

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        for a, b in edges:
            ra, rb = find(a), find(b)
            if ra == rb:
                return False
            parent[ra] = rb
        return True


if __name__ == "__main__":
    sol = Solution()
    assert sol.validTree(5, [[0, 1], [0, 2], [0, 3], [1, 4]]) is True
    assert sol.validTree(5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]) is False
    assert sol.validTree(1, []) is True
    assert sol.validTree(2, [[0, 1]]) is True
    assert sol.validTree(4, [[0, 1], [2, 3]]) is False
    assert sol.validTree(3, [[0, 1], [0, 2], [1, 2]]) is False
    print("All tests passed!")
