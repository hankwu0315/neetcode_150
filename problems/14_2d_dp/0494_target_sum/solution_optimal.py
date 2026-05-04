"""
Problem: 0494. Target Sum
"""
from typing import List


class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        s = sum(nums)
        if abs(target) > s or (s + target) % 2:
            return 0
        p = (s + target) // 2
        dp = [0] * (p + 1)
        dp[0] = 1
        for x in nums:
            for v in range(p, x - 1, -1):
                dp[v] += dp[v - x]
        return dp[p]


if __name__ == "__main__":
    sol = Solution()
    assert sol.findTargetSumWays([1, 1, 1, 1, 1], 3) == 5
    assert sol.findTargetSumWays([1], 1) == 1
    assert sol.findTargetSumWays([1], 2) == 0
    assert sol.findTargetSumWays([0, 0, 0, 0, 0, 0, 0, 0, 1], 1) == 256
    assert sol.findTargetSumWays([1, 2, 3], 0) == 2
    assert sol.findTargetSumWays([100], -200) == 0
    print("All tests passed!")
