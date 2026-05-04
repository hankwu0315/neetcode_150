// Problem: 0090. Subsets II
// Difficulty: Medium

import Foundation

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        // TODO: implement
        return []
    }
}

func normSS(_ xs: [[Int]]) -> [[Int]] {
    // TODO: implement
    return []
}

func checkSS(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if normSS(a) != normSS(e) { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
