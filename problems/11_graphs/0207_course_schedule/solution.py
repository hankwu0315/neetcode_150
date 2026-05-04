"""
Problem: 0207. Course Schedule
Difficulty: Medium
URL: https://leetcode.com/problems/course-schedule/

解法：拓撲排序 (Kahn)。
"""
from __future__ import annotations
from typing import List
from collections import deque


class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        graph: List[List[int]] = [[] for _ in range(numCourses)]
        indeg = [0] * numCourses
        for a, b in prerequisites:
            graph[b].append(a)
            indeg[a] += 1
        q = deque(i for i in range(numCourses) if indeg[i] == 0)
        done = 0
        while q:
            u = q.popleft()
            done += 1
            for v in graph[u]:
                indeg[v] -= 1
                if indeg[v] == 0:
                    q.append(v)
        return done == numCourses


if __name__ == "__main__":
    sol = Solution()
    assert sol.canFinish(2, [[1, 0]]) is True
    assert sol.canFinish(2, [[1, 0], [0, 1]]) is False
    assert sol.canFinish(1, []) is True
    assert sol.canFinish(4, [[1, 0], [2, 1], [3, 2]]) is True
    assert sol.canFinish(3, [[0, 1], [1, 2], [2, 0]]) is False
    assert sol.canFinish(5, []) is True
    print("All tests passed!")
