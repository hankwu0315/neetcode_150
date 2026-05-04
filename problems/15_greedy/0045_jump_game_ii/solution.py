"""
Problem: 0045. Jump Game II
"""
from typing import List


class Solution:
    def jump(self, nums: List[int]) -> int:
        jumps = end = farthest = 0
        for i in range(len(nums) - 1):
            if i + nums[i] > farthest:
                farthest = i + nums[i]
            if i == end:
                jumps += 1
                end = farthest
        return jumps


if __name__ == "__main__":
    sol = Solution()
    assert sol.jump([2, 3, 1, 1, 4]) == 2
    assert sol.jump([2, 3, 0, 1, 4]) == 2
    assert sol.jump([1]) == 0
    assert sol.jump([1, 2]) == 1
    assert sol.jump([1, 1, 1, 1]) == 3
    assert sol.jump([5, 1, 1, 1, 1]) == 1
    print("All tests passed!")
