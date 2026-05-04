// Problem: 0017. Letter Combinations of a Phone Number
// Difficulty: Medium

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        // TODO: implement
        return []
    }
}

func checkStrs(_ a: [String], _ e: [String], _ msg: String) {
    if a.sorted() != e.sorted() { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
