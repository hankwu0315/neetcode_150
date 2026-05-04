"""
Problem: 0518. Coin Change II
"""
from typing import List


class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        dp = [0] * (amount + 1)
        dp[0] = 1
        for c in coins:
            for a in range(c, amount + 1):
                dp[a] += dp[a - c]
        return dp[amount]


if __name__ == "__main__":
    sol = Solution()
    assert sol.change(5, [1, 2, 5]) == 4
    assert sol.change(3, [2]) == 0
    assert sol.change(10, [10]) == 1
    assert sol.change(0, [1, 2]) == 1
    assert sol.change(500, [1, 2, 5]) == 12701
    assert sol.change(7, [1, 5, 10]) == 2
    print("All tests passed!")
