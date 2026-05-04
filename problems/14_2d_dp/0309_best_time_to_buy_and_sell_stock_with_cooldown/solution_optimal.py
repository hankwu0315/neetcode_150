"""
Problem: 0309. Best Time to Buy and Sell Stock with Cooldown
"""
from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0
        hold, sold, rest = -prices[0], 0, 0
        for i in range(1, len(prices)):
            p = prices[i]
            new_hold = max(hold, rest - p)
            new_sold = hold + p
            new_rest = max(rest, sold)
            hold, sold, rest = new_hold, new_sold, new_rest
        return max(sold, rest)


if __name__ == "__main__":
    sol = Solution()
    assert sol.maxProfit([1, 2, 3, 0, 2]) == 3
    assert sol.maxProfit([1]) == 0
    assert sol.maxProfit([]) == 0
    assert sol.maxProfit([1, 2, 4]) == 3
    assert sol.maxProfit([6, 1, 3, 2, 4, 7]) == 6
    assert sol.maxProfit([2, 1]) == 0
    print("All tests passed!")
