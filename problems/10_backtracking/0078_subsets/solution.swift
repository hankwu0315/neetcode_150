// Problem: 0078. Subsets
// Difficulty: Medium

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        // TODO: implement
        return []
    }
}

func normalize(_ xs: [[Int]]) -> [[Int]] {
    // TODO: implement
    return []
}

func checkSets(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    let na = normalize(a), ne = normalize(e)
    if na != ne { fatalError("FAIL \(msg): \(na) vs \(ne)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
