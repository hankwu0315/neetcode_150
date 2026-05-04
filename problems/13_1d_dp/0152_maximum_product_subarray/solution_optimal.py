"""
Problem: 0152. Maximum Product Subarray
"""
from typing import List


class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        ans = mx = mn = nums[0]
        for x in nums[1:]:
            cands = (x, x * mx, x * mn)
            mx = max(cands)
            mn = min(cands)
            if mx > ans:
                ans = mx
        return ans


if __name__ == "__main__":
    sol = Solution()
    assert sol.maxProduct([2, 3, -2, 4]) == 6
    assert sol.maxProduct([-2, 0, -1]) == 0
    assert sol.maxProduct([-2, 3, -4]) == 24
    assert sol.maxProduct([0, 2]) == 2
    assert sol.maxProduct([-2]) == -2
    assert sol.maxProduct([2, -5, -2, -4, 3]) == 24
    print("All tests passed!")
