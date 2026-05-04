// Problem: 11. Container With Most Water
// Difficulty: Medium
// URL: https://leetcode.com/problems/container-with-most-water/
//
// 【解法演進】暴力 O(n²) → 雙指標 O(n)（最佳）
// 【最佳解核心思路】每次移動較矮的一側。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // TODO: implement
        return 0
    }

    func maxArea_brute(_ height: [Int]) -> Int {
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
