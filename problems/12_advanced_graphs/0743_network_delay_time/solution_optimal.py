"""
Problem: 0743. Network Delay Time
Difficulty: Medium
URL: https://leetcode.com/problems/network-delay-time/

解法：Dijkstra。
"""
from __future__ import annotations
from typing import List
import heapq


class Solution:
    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:
        graph: List[List[tuple]] = [[] for _ in range(n + 1)]
        for u, v, w in times:
            graph[u].append((v, w))
        INF = float('inf')
        dist = [INF] * (n + 1)
        dist[k] = 0
        h = [(0, k)]
        while h:
            d, u = heapq.heappop(h)
            if d > dist[u]:
                continue
            for v, w in graph[u]:
                nd = d + w
                if nd < dist[v]:
                    dist[v] = nd
                    heapq.heappush(h, (nd, v))
        ans = max(dist[1:])
        return -1 if ans == INF else ans


if __name__ == "__main__":
    sol = Solution()
    assert sol.networkDelayTime([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2) == 2
    assert sol.networkDelayTime([[1, 2, 1]], 2, 1) == 1
    assert sol.networkDelayTime([[1, 2, 1]], 2, 2) == -1
    assert sol.networkDelayTime([[1, 2, 1], [2, 1, 3]], 2, 2) == 3
    assert sol.networkDelayTime([[1, 2, 1], [2, 3, 2], [1, 3, 4]], 3, 1) == 3
    assert sol.networkDelayTime([], 1, 1) == 0
    print("All tests passed!")
