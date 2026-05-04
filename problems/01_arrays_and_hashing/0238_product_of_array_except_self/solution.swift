// Problem: 238. Product of Array Except Self
// Difficulty: Medium
// URL: https://leetcode.com/problems/product-of-array-except-self/
//
// 【解法演進】暴力 O(n²) → 左右前綴 O(n)/O(n) → 原地兩遍掃描 O(n)/O(1)（最佳）
// 【最佳解核心思路】answer 第一遍存左前綴，第二遍從右到左乘右後綴。
// 【複雜度】時間：O(n)  空間：O(1)（不計輸出）

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // TODO: implement
        return []
    }

    func productExceptSelf_brute(_ nums: [Int]) -> [Int] {
        // TODO: implement
        return []
    }
}

func checkArr(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
