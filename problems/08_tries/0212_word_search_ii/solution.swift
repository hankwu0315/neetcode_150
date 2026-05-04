// Problem: 0212. Word Search II
// Difficulty: Hard

import Foundation

final class WSNode {
    var ch: [Character: WSNode] = [:]
    var word: String? = nil
}

func buildWS(_ words: [String]) -> WSNode {
    // TODO: implement
    return nil
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        // TODO: implement
        return []
    }
}

func toCharGrid(_ a: [[String]]) -> [[Character]] {
    a.map { $0.map { Character($0) } }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
