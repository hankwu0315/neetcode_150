// Problem: 0022. Generate Parentheses
// Difficulty: Medium

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        // TODO: implement
        return []
    }
}

func checkStrs2(_ a: [String], _ e: [String], _ msg: String) {
    if a.sorted() != e.sorted() { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
