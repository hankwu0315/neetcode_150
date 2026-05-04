"""
Problem: 0198. House Robber
"""
from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        prev2, prev1 = 0, 0
        for x in nums:
            prev2, prev1 = prev1, max(prev1, prev2 + x)
        return prev1


if __name__ == "__main__":
    sol = Solution()
    assert sol.rob([1, 2, 3, 1]) == 4
    assert sol.rob([2, 7, 9, 3, 1]) == 12
    assert sol.rob([]) == 0
    assert sol.rob([5]) == 5
    assert sol.rob([2, 1]) == 2
    assert sol.rob([2, 1, 1, 2]) == 4
    print("All tests passed!")
