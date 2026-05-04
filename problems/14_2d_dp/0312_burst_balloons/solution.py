"""
Problem: 0312. Burst Balloons
"""
from typing import List


class Solution:
    def maxCoins(self, nums: List[int]) -> int:
        a = [1] + nums + [1]
        n = len(a)
        dp = [[0] * n for _ in range(n)]
        for length in range(2, n):
            for l in range(0, n - length):
                r = l + length
                best = 0
                for k in range(l + 1, r):
                    v = dp[l][k] + dp[k][r] + a[l] * a[k] * a[r]
                    if v > best:
                        best = v
                dp[l][r] = best
        return dp[0][n - 1]


if __name__ == "__main__":
    sol = Solution()
    assert sol.maxCoins([3, 1, 5, 8]) == 167
    assert sol.maxCoins([1, 5]) == 10
    assert sol.maxCoins([5]) == 5
    assert sol.maxCoins([]) == 0
    assert sol.maxCoins([1, 2, 3]) == 12
    assert sol.maxCoins([7, 9, 8, 0, 7, 1, 3, 5, 5, 2]) == 1582
    print("All tests passed!")
