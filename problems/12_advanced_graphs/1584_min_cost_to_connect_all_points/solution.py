"""
Problem: 1584. Min Cost to Connect All Points
Difficulty: Medium
URL: https://leetcode.com/problems/min-cost-to-connect-all-points/

解法：Prim 最小生成樹。
"""
from __future__ import annotations
from typing import List
import heapq


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        if n <= 1:
            return 0
        in_mst = [False] * n
        h = [(0, 0)]
        total = 0
        seen = 0
        while h and seen < n:
            d, u = heapq.heappop(h)
            if in_mst[u]:
                continue
            in_mst[u] = True
            total += d
            seen += 1
            for v in range(n):
                if not in_mst[v]:
                    nd = abs(points[u][0] - points[v][0]) + abs(points[u][1] - points[v][1])
                    heapq.heappush(h, (nd, v))
        return total


if __name__ == "__main__":
    sol = Solution()
    assert sol.minCostConnectPoints([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]]) == 20
    assert sol.minCostConnectPoints([[3, 12], [-2, 5], [-4, 1]]) == 18
    assert sol.minCostConnectPoints([[0, 0]]) == 0
    assert sol.minCostConnectPoints([[0, 0], [1, 1]]) == 2
    assert sol.minCostConnectPoints([[2, -3], [-17, -8], [13, 8], [-17, -15]]) == 53
    assert sol.minCostConnectPoints([]) == 0
    print("All tests passed!")
