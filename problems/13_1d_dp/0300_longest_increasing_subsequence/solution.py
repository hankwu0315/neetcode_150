"""
Problem: 0300. Longest Increasing Subsequence
"""
from typing import List
from bisect import bisect_left


class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        tails: List[int] = []
        for x in nums:
            i = bisect_left(tails, x)
            if i == len(tails):
                tails.append(x)
            else:
                tails[i] = x
        return len(tails)


if __name__ == "__main__":
    sol = Solution()
    assert sol.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]) == 4
    assert sol.lengthOfLIS([0, 1, 0, 3, 2, 3]) == 4
    assert sol.lengthOfLIS([7, 7, 7, 7]) == 1
    assert sol.lengthOfLIS([]) == 0
    assert sol.lengthOfLIS([1]) == 1
    assert sol.lengthOfLIS([4, 10, 4, 3, 8, 9]) == 3
    print("All tests passed!")
