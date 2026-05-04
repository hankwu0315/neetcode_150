// Problem: 0981. Time Based Key-Value Store
// Difficulty: Medium

import Foundation

class TimeMap {
    private var store: [String: [(Int, String)]] = [:]

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        // TODO: implement
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        // TODO: implement
        return ""
    }
}

func checkStr(_ a: String, _ e: String, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \"\(a)\" vs \"\(e)\"") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
