// Problem: 125. Valid Palindrome
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-palindrome/
//
// 【解法演進】清理 + 反轉 → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】左右指標相向，跳過非英數，比較小寫字元。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // TODO: implement
        return false
    }

    func isPalindrome_brute(_ s: String) -> Bool {
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
