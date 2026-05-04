// Problem: 42. Trapping Rain Water
// Difficulty: Hard
// URL: https://leetcode.com/problems/trapping-rain-water/
//
// 【解法演進】暴力 → 前綴後綴 → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】何側較矮就結算何側水量並更新該側 max。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        // TODO: implement
        return 0
    }

    func trap_arrays(_ height: [Int]) -> Int {
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
