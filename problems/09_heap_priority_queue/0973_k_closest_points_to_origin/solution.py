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
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
