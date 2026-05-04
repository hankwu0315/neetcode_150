"""
Problem: 0875. Koko Eating Bananas
Difficulty: Medium
URL: https://leetcode.com/problems/koko-eating-bananas/

解法演進：
1) 暴力線性 O(M*n)：從 k=1 試到 max(piles)。
2) 對 k 二分 O(n log M)：可行性單調，找最小可行 k。

最佳解核心思路：
- 速度 k 越大耗時越少（單調），標準「找最小可行值」二分。

複雜度：O(n log M) / O(1)。
"""

import math

class Solution:
    def minEatingSpeed(self, piles: list[int], h: int) -> int:
        pass

    def minEatingSpeed_brute(self, piles: list[int], h: int) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
