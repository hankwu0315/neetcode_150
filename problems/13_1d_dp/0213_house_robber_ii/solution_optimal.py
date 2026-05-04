"""
Problem: 0213. House Robber II
"""
from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        if not nums:
            return 0
        if len(nums) == 1:
            return nums[0]

        def linear(arr):
            p2, p1 = 0, 0
            for x in arr:
                p2, p1 = p1, max(p1, p2 + x)
            return p1

        return max(linear(nums[1:]), linear(nums[:-1]))


if __name__ == "__main__":
    sol = Solution()
    assert sol.rob([2, 3, 2]) == 3
    assert sol.rob([1, 2, 3, 1]) == 4
    assert sol.rob([1, 2, 3]) == 3
    assert sol.rob([]) == 0
    assert sol.rob([5]) == 5
    assert sol.rob([1, 2]) == 2
    print("All tests passed!")
