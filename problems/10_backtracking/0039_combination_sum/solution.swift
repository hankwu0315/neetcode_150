// Problem: 0039. Combination Sum
// Difficulty: Medium

import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // TODO: implement
        return []
    }
}

func normCS(_ xs: [[Int]]) -> [[Int]] {
    // TODO: implement
    return []
}

func checkCS(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if normCS(a) != normCS(e) { fatalError("FAIL \(msg): \(normCS(a)) vs \(normCS(e))") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
