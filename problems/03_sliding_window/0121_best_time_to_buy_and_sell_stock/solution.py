"""
Problem: 121. Best Time to Buy and Sell Stock
Difficulty: Easy
URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

【解法演進】暴力 O(n²) → 一遍掃描維護最小價 O(n)（最佳）
【最佳解核心思路】每天記錄迄今最低買價，計算「今天賣出」的最大利潤。
【複雜度】時間：O(n)  空間：O(1)
"""

from typing import List

class Solution:
    # 最佳解
    def maxProfit(self, prices: List[int]) -> int:
        pass

    def maxProfit_brute(self, prices: List[int]) -> int:
        pass


if __name__ == "__main__":
    solution = Solution()

    # Test 1
    # result = solution.solve(...)
    # assert result == expected

    print("All tests passed!")
