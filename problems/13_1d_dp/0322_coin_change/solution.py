"""
Problem: 0322. Coin Change
"""
from typing import List


class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        INF = amount + 1
        dp = [0] + [INF] * amount
        for a in range(1, amount + 1):
            for c in coins:
                if c <= a and dp[a - c] + 1 < dp[a]:
                    dp[a] = dp[a - c] + 1
        return dp[amount] if dp[amount] != INF else -1


if __name__ == "__main__":
    sol = Solution()
    assert sol.coinChange([1, 2, 5], 11) == 3
    assert sol.coinChange([2], 3) == -1
    assert sol.coinChange([1], 0) == 0
    assert sol.coinChange([1], 2) == 2
    assert sol.coinChange([186, 419, 83, 408], 6249) == 20
    assert sol.coinChange([2, 5, 10, 1], 27) == 4
    print("All tests passed!")
