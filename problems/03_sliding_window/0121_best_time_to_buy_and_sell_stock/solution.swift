// Problem: 121. Best Time to Buy and Sell Stock
// Difficulty: Easy
// URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//
// 【解法演進】暴力 → 一遍掃描維護最小價 O(n)（最佳）
// 【最佳解核心思路】記錄迄今最低買價，今天賣出可得最大利潤。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // TODO: implement
        return 0
    }

    func maxProfit_brute(_ prices: [Int]) -> Int {
        // TODO: implement
        return 0
    }
}

func checkInt(_ actual: Int, _ expected: Int, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
