// Problem: 217. Contains Duplicate
// Difficulty: Easy
// URL: https://leetcode.com/problems/contains-duplicate/
//
// 【解法演進】暴力 O(n²) → 排序 O(n log n) → HashSet O(n)（最佳）
// 【最佳解核心思路】
//   走訪陣列維護 seen 集合，遇到已見元素即回傳 true。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    // 最佳解：HashSet
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // TODO: implement
        return false
    }

    // 暴力解：兩兩比較
    func containsDuplicate_brute(_ nums: [Int]) -> Bool {
        // TODO: implement
        return false
    }

    // 排序後比鄰
    func containsDuplicate_sort(_ nums: [Int]) -> Bool {
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
