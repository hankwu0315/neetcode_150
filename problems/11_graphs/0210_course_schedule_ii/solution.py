"""
Problem: 0210. Course Schedule II
Difficulty: Medium
URL: https://leetcode.com/problems/course-schedule-ii/

解法：拓撲排序 (Kahn)。
"""
from __future__ import annotations
from typing import List
from collections import deque


class Solution:
    def findOrder(self, numCourses: int, prerequisites: List[List[int]]) -> List[int]:
        g: List[List[int]] = [[] for _ in range(numCourses)]
        indeg = [0] * numCourses
        for a, b in prerequisites:
            g[b].append(a)
            indeg[a] += 1
        q = deque(i for i in range(numCourses) if indeg[i] == 0)
        order: List[int] = []
        while q:
            u = q.popleft()
            order.append(u)
            for v in g[u]:
                indeg[v] -= 1
                if indeg[v] == 0:
                    q.append(v)
        return order if len(order) == numCourses else []


def _is_valid_order(order: List[int], n: int, prereqs: List[List[int]]) -> bool:
    if len(order) != n:
        return False
    if set(order) != set(range(n)):
        return False
    pos = {v: i for i, v in enumerate(order)}
    for a, b in prereqs:
        if pos[b] > pos[a]:
            return False
    return True


if __name__ == "__main__":
    sol = Solution()
    p1 = [[1, 0]]; o1 = sol.findOrder(2, p1)
    assert _is_valid_order(o1, 2, p1)
    p2 = [[1, 0], [2, 0], [3, 1], [3, 2]]; o2 = sol.findOrder(4, p2)
    assert _is_valid_order(o2, 4, p2)
    assert sol.findOrder(2, [[1, 0], [0, 1]]) == []
    p3: list = []; o3 = sol.findOrder(3, p3)
    assert _is_valid_order(o3, 3, p3)
    assert sol.findOrder(1, []) == [0]
    assert sol.findOrder(3, [[0, 1], [1, 2], [2, 0]]) == []
    print("All tests passed!")
