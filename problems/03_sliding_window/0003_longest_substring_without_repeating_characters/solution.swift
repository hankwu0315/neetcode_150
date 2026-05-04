// Problem: 3. Longest Substring Without Repeating Characters
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-substring-without-repeating-characters/
//
// 【解法演進】暴力 O(n²) → 滑動窗口 + HashMap O(n)（最佳）
// 【最佳解核心思路】記錄每字元上次出現索引；遇重複跳左界。
// 【複雜度】時間：O(n)  空間：O(min(n, |Σ|))

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // TODO: implement
        return 0
    }

    func lengthOfLongestSubstring_brute(_ s: String) -> Int {
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
