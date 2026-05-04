// Problem: 0150. Evaluate Reverse Polish Notation
// Difficulty: Medium
// URL: https://leetcode.com/problems/evaluate-reverse-polish-notation/
//
// 最佳解：堆疊；Swift 整數除法 / 對負數即為向 0 截斷。

import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        // TODO: implement
        return 0
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
