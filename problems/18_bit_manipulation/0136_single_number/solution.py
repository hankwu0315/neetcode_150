"""
Problem: 0136. Single Number
"""
from typing import List


class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        x = 0
        for v in nums:
            x ^= v
        return x


if __name__ == "__main__":
    sol = Solution()
    assert sol.singleNumber([2, 2, 1]) == 1
    assert sol.singleNumber([4, 1, 2, 1, 2]) == 4
    assert sol.singleNumber([1]) == 1
    assert sol.singleNumber([7, 3, 5, 4, 5, 3, 4]) == 7
    print("All tests passed!")
