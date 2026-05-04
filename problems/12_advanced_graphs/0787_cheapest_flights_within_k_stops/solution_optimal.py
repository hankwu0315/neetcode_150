"""
Problem: 0787. Cheapest Flights Within K Stops
Difficulty: Medium
URL: https://leetcode.com/problems/cheapest-flights-within-k-stops/

解法：Bellman-Ford 限 K+1 步。
"""
from __future__ import annotations
from typing import List


class Solution:
    def findCheapestPrice(
        self, n: int, flights: List[List[int]], src: int, dst: int, k: int
    ) -> int:
        INF = float('inf')
        dist = [INF] * n
        dist[src] = 0
        for _ in range(k + 1):
            nd = dist[:]
            for u, v, w in flights:
                if dist[u] + w < nd[v]:
                    nd[v] = dist[u] + w
            dist = nd
        return -1 if dist[dst] == INF else dist[dst]


if __name__ == "__main__":
    sol = Solution()
    assert sol.findCheapestPrice(
        4, [[0, 1, 100], [1, 2, 100], [2, 0, 100], [1, 3, 600], [2, 3, 200]],
        0, 3, 1
    ) == 700
    assert sol.findCheapestPrice(
        3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1
    ) == 200
    assert sol.findCheapestPrice(
        3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0
    ) == 500
    assert sol.findCheapestPrice(2, [[0, 1, 100]], 0, 1, 1) == 100
    assert sol.findCheapestPrice(2, [], 0, 1, 1) == -1
    assert sol.findCheapestPrice(3, [[0, 1, 1], [1, 2, 1]], 0, 2, 0) == -1
    print("All tests passed!")
