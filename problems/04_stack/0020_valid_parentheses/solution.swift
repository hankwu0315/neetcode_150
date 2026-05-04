// Problem: 0020. Valid Parentheses
// Difficulty: Easy
// URL: https://leetcode.com/problems/valid-parentheses/
//
// 最佳解：堆疊。O(n) / O(n)。

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        // TODO: implement
        return false
    }

    func isValid_brute(_ s: String) -> Bool {
        // TODO: implement
        return false
    }
}

func checkBool(_ actual: Bool, _ expected: Bool, _ msg: String) {
    if actual != expected { fatalError("FAIL \(msg): got \(actual), expected \(expected)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
