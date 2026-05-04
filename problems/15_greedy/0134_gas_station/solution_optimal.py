"""
Problem: 0134. Gas Station
"""
from typing import List


class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        if sum(gas) < sum(cost):
            return -1
        start = tank = 0
        for i in range(len(gas)):
            tank += gas[i] - cost[i]
            if tank < 0:
                start = i + 1
                tank = 0
        return start


if __name__ == "__main__":
    sol = Solution()
    assert sol.canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]) == 3
    assert sol.canCompleteCircuit([2, 3, 4], [3, 4, 3]) == -1
    assert sol.canCompleteCircuit([5], [4]) == 0
    assert sol.canCompleteCircuit([5], [6]) == -1
    assert sol.canCompleteCircuit([4, 5, 2, 6, 5, 3], [3, 2, 7, 3, 2, 9]) == -1
    assert sol.canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]) == 3
    print("All tests passed!")
