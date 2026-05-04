// Problem: 128. Longest Consecutive Sequence
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-consecutive-sequence/
//
// 【解法演進】排序 O(n log n) → HashSet + 從起點展開 O(n)（最佳）
// 【最佳解核心思路】只從序列起點（x-1 不在 set）開始向上展開。
// 【複雜度】時間：O(n)  空間：O(n)

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // TODO: implement
        return 0
    }

    func longestConsecutive_brute(_ nums: [Int]) -> Int {
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
