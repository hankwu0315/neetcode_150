"""
Problem: 0053. Maximum Subarray
"""
from typing import List


class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        cur = best = nums[0]
        for x in nums[1:]:
            cur = max(x, cur + x)
            if cur > best:
                best = cur
        return best


if __name__ == "__main__":
    sol = Solution()
    assert sol.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
    assert sol.maxSubArray([1]) == 1
    assert sol.maxSubArray([5, 4, -1, 7, 8]) == 23
    assert sol.maxSubArray([-1]) == -1
    assert sol.maxSubArray([-2, -1]) == -1
    assert sol.maxSubArray([1, 2, 3, 4]) == 10
    print("All tests passed!")
