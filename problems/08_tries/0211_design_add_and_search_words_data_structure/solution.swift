// Problem: 0211. Design Add and Search Words Data Structure
// Difficulty: Medium

import Foundation

final class WDNode {
    var ch: [Character: WDNode] = [:]
    var end: Bool = false
}

class WordDictionary {
    private let root = WDNode()
    init() {
        // TODO: implement
    }
    func addWord(_ word: String) {
        // TODO: implement
    }
    func search(_ word: String) -> Bool {
        // TODO: implement
        return false
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
