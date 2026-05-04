// Problem: 76. Minimum Window Substring
// Difficulty: Hard
// URL: https://leetcode.com/problems/minimum-window-substring/
//
// 【解法演進】暴力 O(n²) → 滑動窗口 + have/required（最佳）
// 【最佳解核心思路】need + window 計數，have 達 required 時縮左更新答案。
// 【複雜度】時間：O(|s| + |t|)  空間：O(|Σ|)

import Foundation

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // TODO: implement
        return ""
    }
}

func checkStr(_ actual: String, _ expected: String, _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \"\(expected)\" but got \"\(actual)\"") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
