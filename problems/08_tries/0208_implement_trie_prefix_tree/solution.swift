// Problem: 0208. Implement Trie (Prefix Tree)
// Difficulty: Medium

import Foundation

final class TrieNode {
    var ch: [Character: TrieNode] = [:]
    var end: Bool = false
}

class Trie {
    private let root = TrieNode()
    init() {
        // TODO: implement
    }
    func insert(_ word: String) {
        // TODO: implement
    }
    private func walk(_ s: String) -> TrieNode? {
        // TODO: implement
        return nil
    }
    func search(_ w: String) -> Bool {
        // TODO: implement
        return false
    }
    func startsWith(_ p: String) -> Bool {
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
