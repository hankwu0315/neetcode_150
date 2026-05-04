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
        best = 0
        minPrice = float("inf")
        for p in prices:
            if p - minPrice > best:
                best = p - minPrice
            if p < minPrice:
                minPrice = p
        return best

    # 暴力解
    def maxProfit_brute(self, prices: List[int]) -> int:
        best = 0
        n = len(prices)
        for i in range(n):
            for j in range(i + 1, n):
                if prices[j] - prices[i] > best:
                    best = prices[j] - prices[i]
        return best


if __name__ == "__main__":
    s = Solution()

    assert s.maxProfit([7, 1, 5, 3, 6, 4]) == 5, "Test 1 failed"
    assert s.maxProfit([7, 6, 4, 3, 1]) == 0, "Test 2 failed"
    assert s.maxProfit([1]) == 0, "Test 3 failed (single)"
    assert s.maxProfit([]) == 0, "Test 4 failed (empty)"
    assert s.maxProfit([2, 4, 1]) == 2, "Test 5 failed"
    assert s.maxProfit([3, 3, 3, 3]) == 0, "Test 6 failed (flat)"

    assert s.maxProfit_brute([7, 1, 5, 3, 6, 4]) == 5, "Brute Test failed"

    print("All tests passed!")
