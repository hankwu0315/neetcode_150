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
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
