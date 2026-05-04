// Problem: 0131. Palindrome Partitioning
// Difficulty: Medium

import Foundation

class Solution {
    func partition(_ s: String) -> [[String]] {
        // TODO: implement
        return []
    }
}

func normLLS(_ xs: [[String]]) -> [[String]] {
    // TODO: implement
    return []
}

func checkLLS(_ a: [[String]], _ e: [[String]], _ msg: String) {
    if normLLS(a) != normLLS(e) { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
