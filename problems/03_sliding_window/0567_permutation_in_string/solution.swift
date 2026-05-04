// Problem: 567. Permutation in String
// Difficulty: Medium
// URL: https://leetcode.com/problems/permutation-in-string/
//
// 【解法演進】排序 → 計數比較 → 固定窗口 + matches O(n)（最佳）
// 【最佳解核心思路】維護兩 26 元計數與 matches，滑窗時依相等狀態翻轉更新。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
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
