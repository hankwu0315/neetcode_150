"""
Problem: 0055. Jump Game
"""
from typing import List


class Solution:
    def canJump(self, nums: List[int]) -> bool:
        reach = 0
        for i, x in enumerate(nums):
            if i > reach:
                return False
            if i + x > reach:
                reach = i + x
        return True


if __name__ == "__main__":
    sol = Solution()
    assert sol.canJump([2, 3, 1, 1, 4]) is True
    assert sol.canJump([3, 2, 1, 0, 4]) is False
    assert sol.canJump([0]) is True
    assert sol.canJump([2, 0]) is True
    assert sol.canJump([1, 0, 1]) is False
    assert sol.canJump([2, 0, 0]) is True
    print("All tests passed!")
