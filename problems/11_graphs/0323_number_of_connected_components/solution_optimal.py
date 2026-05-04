"""
Problem: 0323. Number of Connected Components in an Undirected Graph
Difficulty: Medium
URL: https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/

解法：Union-Find。
"""
from __future__ import annotations
from typing import List


class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        parent = list(range(n))

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        comps = n
        for a, b in edges:
            ra, rb = find(a), find(b)
            if ra != rb:
                parent[ra] = rb
                comps -= 1
        return comps


if __name__ == "__main__":
    sol = Solution()
    assert sol.countComponents(5, [[0, 1], [1, 2], [3, 4]]) == 2
    assert sol.countComponents(5, [[0, 1], [1, 2], [2, 3], [3, 4]]) == 1
    assert sol.countComponents(4, []) == 4
    assert sol.countComponents(1, []) == 1
    assert sol.countComponents(6, [[0, 1], [2, 3], [4, 5]]) == 3
    assert sol.countComponents(4, [[0, 1], [1, 2], [0, 2]]) == 2
    print("All tests passed!")
