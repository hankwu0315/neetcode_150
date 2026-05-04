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
        pass


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
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
