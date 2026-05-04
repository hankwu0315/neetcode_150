"""
Problem: 0746. Min Cost Climbing Stairs
"""
from typing import List


class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        a, b = 0, 0
        for i in range(2, len(cost) + 1):
            c = min(b + cost[i - 1], a + cost[i - 2])
            a, b = b, c
        return b


if __name__ == "__main__":
    sol = Solution()
    assert sol.minCostClimbingStairs([10, 15, 20]) == 15
    assert sol.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) == 6
    assert sol.minCostClimbingStairs([0, 0]) == 0
    assert sol.minCostClimbingStairs([1, 2]) == 1
    assert sol.minCostClimbingStairs([10, 15]) == 10
    assert sol.minCostClimbingStairs([0, 1, 2, 2]) == 2
    print("All tests passed!")
