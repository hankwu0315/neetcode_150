"""
Problem: 0332. Reconstruct Itinerary
Difficulty: Hard
URL: https://leetcode.com/problems/reconstruct-itinerary/

解法：Hierholzer + 字典序。
"""
from __future__ import annotations
from typing import List, Dict
from collections import defaultdict


class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        graph: Dict[str, List[str]] = defaultdict(list)
        for a, b in tickets:
            graph[a].append(b)
        for k in graph:
            graph[k].sort(reverse=True)  # pop end == 字典序最小

        out: List[str] = []

        def dfs(u: str) -> None:
            while graph[u]:
                v = graph[u].pop()
                dfs(v)
            out.append(u)

        dfs("JFK")
        return out[::-1]


if __name__ == "__main__":
    sol = Solution()
    assert sol.findItinerary([
        ["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]
    ]) == ["JFK", "MUC", "LHR", "SFO", "SJC"]
    assert sol.findItinerary([
        ["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"],
        ["ATL", "JFK"], ["ATL", "SFO"]
    ]) == ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"]
    assert sol.findItinerary([["JFK", "KUL"], ["JFK", "NRT"], ["NRT", "JFK"]]) == [
        "JFK", "NRT", "JFK", "KUL"
    ]
    assert sol.findItinerary([["JFK", "A"]]) == ["JFK", "A"]
    assert sol.findItinerary([["JFK", "B"], ["JFK", "A"], ["A", "JFK"]]) == [
        "JFK", "A", "JFK", "B"
    ]
    print("All tests passed!")
