// Problem: 242. Valid Anagram
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-anagram/
//
// 【解法演進】排序比較 O(n log n) → 計數 O(n)（最佳）
// 【最佳解核心思路】長度不同直接 false；s +1、t -1，最後檢查全 0。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // TODO: implement
        return false
    }

    // 暴力解：排序比較
    func isAnagram_brute(_ s: String, _ t: String) -> Bool {
        // TODO: implement
        return false
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
