"""
Problem: 0973. K Closest Points to Origin
Difficulty: Medium
URL: https://leetcode.com/problems/k-closest-points-to-origin/

解法：大小 k 的 max-heap，O(n log k)/O(k)。
"""
from __future__ import annotations
from typing import List
import heapq


class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        h: List = []
        for x, y in points:
            d = -(x * x + y * y)  # max-heap via negation
            if len(h) < k:
                heapq.heappush(h, (d, x, y))
            elif d > h[0][0]:
                heapq.heapreplace(h, (d, x, y))
        return [[x, y] for _, x, y in h]


if __name__ == "__main__":
    sol = Solution()

    def norm(arr):
        return sorted(map(tuple, arr))

    assert norm(sol.kClosest([[1, 3], [-2, 2]], 1)) == norm([[-2, 2]])
    assert norm(sol.kClosest([[3, 3], [5, -1], [-2, 4]], 2)) == norm([[3, 3], [-2, 4]])
    assert norm(sol.kClosest([[1, 1]], 1)) == norm([[1, 1]])
    assert norm(sol.kClosest([[0, 1], [1, 0]], 2)) == norm([[0, 1], [1, 0]])
    assert norm(sol.kClosest([[2, 2], [2, 2], [3, 3]], 2)) == norm([[2, 2], [2, 2]])
    print("All tests passed!")
