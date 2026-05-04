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
        def hours(k: int) -> int:
            return sum((p + k - 1) // k for p in piles)

        l, r = 1, max(piles)
        while l < r:
            mid = l + (r - l) // 2
            if hours(mid) <= h:
                r = mid
            else:
                l = mid + 1
        return l

    def minEatingSpeed_brute(self, piles: list[int], h: int) -> int:
        for k in range(1, max(piles) + 1):
            if sum(math.ceil(p / k) for p in piles) <= h:
                return k
        return max(piles)


if __name__ == "__main__":
    sol = Solution()
    for fn in (sol.minEatingSpeed, sol.minEatingSpeed_brute):
        assert fn([3, 6, 7, 11], 8) == 4
        assert fn([30, 11, 23, 4, 20], 5) == 30
        assert fn([30, 11, 23, 4, 20], 6) == 23
        # h 等於 n（每小時吃一堆）
        assert fn([1, 1, 1, 1], 4) == 1
        # 一堆
        assert fn([10], 5) == 2
        assert fn([10], 10) == 1
    print("All tests passed!")
