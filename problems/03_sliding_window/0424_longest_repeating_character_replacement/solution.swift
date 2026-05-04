// Problem: 424. Longest Repeating Character Replacement
// Difficulty: Medium
// URL: https://leetcode.com/problems/longest-repeating-character-replacement/
//
// 【解法演進】枚舉主導字母 → 單一滑動窗口 O(n)（最佳）
// 【最佳解核心思路】窗口 + count[26] + maxCount；窗長 - maxCount > k 則縮左。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
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
