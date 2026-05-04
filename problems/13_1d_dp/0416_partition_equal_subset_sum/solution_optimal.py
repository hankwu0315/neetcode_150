"""
Problem: 0416. Partition Equal Subset Sum
"""
from typing import List


class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        s = sum(nums)
        if s % 2:
            return False
        target = s // 2
        dp = 1  # bitset
        for x in nums:
            dp |= dp << x
        return ((dp >> target) & 1) == 1


if __name__ == "__main__":
    sol = Solution()
    assert sol.canPartition([1, 5, 11, 5]) is True
    assert sol.canPartition([1, 2, 3, 5]) is False
    assert sol.canPartition([1, 1]) is True
    assert sol.canPartition([2, 2, 1, 1]) is True
    assert sol.canPartition([1]) is False
    assert sol.canPartition([100, 100, 100, 100, 100, 100, 100, 100]) is True
    print("All tests passed!")
