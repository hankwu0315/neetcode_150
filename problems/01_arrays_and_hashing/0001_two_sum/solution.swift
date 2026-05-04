// Problem: 1. Two Sum
// Difficulty: Easy
// URL: https://leetcode.com/problems/two-sum/
//
// 【解法演進】暴力 O(n²) → 一遍雜湊 O(n)（最佳）
// 【最佳解核心思路】先查 (target - x) 是否已見，沒有再寫入。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    // 最佳解：一遍 HashMap
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // TODO: implement
        return []
    }

    // 暴力解
    func twoSum_brute(_ nums: [Int], _ target: Int) -> [Int] {
        // TODO: implement
        return []
    }
}

func checkPair(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual.sorted() == expected.sorted() { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected.sorted()) but got \(actual.sorted())") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
