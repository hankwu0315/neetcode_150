"""
Problem: 0268. Missing Number
"""
from typing import List


class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        x = len(nums)
        for i, v in enumerate(nums):
            x ^= i ^ v
        return x


if __name__ == "__main__":
    sol = Solution()
    assert sol.missingNumber([3, 0, 1]) == 2
    assert sol.missingNumber([0, 1]) == 2
    assert sol.missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]) == 8
    assert sol.missingNumber([0]) == 1
    assert sol.missingNumber([1]) == 0
    print("All tests passed!")
