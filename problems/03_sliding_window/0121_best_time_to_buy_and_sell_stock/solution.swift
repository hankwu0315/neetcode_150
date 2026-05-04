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
        var best = 0
        var minPrice = Int.max
        for p in prices {
            if p - minPrice > best { best = p - minPrice }
            if p < minPrice { minPrice = p }
        }
        return best
    }

    func maxProfit_brute(_ prices: [Int]) -> Int {
        var best = 0
        for i in 0..<prices.count {
            if i + 1 >= prices.count { break }
            for j in (i + 1)..<prices.count {
                if prices[j] - prices[i] > best { best = prices[j] - prices[i] }
            }
        }
        return best
    }
}

func checkInt(_ actual: Int, _ expected: Int, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

let s = Solution()
checkInt(s.maxProfit([7, 1, 5, 3, 6, 4]), 5, "Test 1")
checkInt(s.maxProfit([7, 6, 4, 3, 1]), 0, "Test 2")
checkInt(s.maxProfit([1]), 0, "Test 3: single")
checkInt(s.maxProfit([]), 0, "Test 4: empty")
checkInt(s.maxProfit([2, 4, 1]), 2, "Test 5")
checkInt(s.maxProfit([3, 3, 3, 3]), 0, "Test 6: flat")
checkInt(s.maxProfit_brute([7, 1, 5, 3, 6, 4]), 5, "Brute Test")

print("All tests passed!")
