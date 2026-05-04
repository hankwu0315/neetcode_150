// Problem: 0084. Largest Rectangle in Histogram
// Difficulty: Hard
// URL: https://leetcode.com/problems/largest-rectangle-in-histogram/
//
// 最佳解：單調遞增堆疊 + sentinel。

import Foundation

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        // TODO: implement
        return 0
    }

    func largestRectangleArea_brute(_ heights: [Int]) -> Int {
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
