// Problem: 0146. LRU Cache
// Difficulty: Medium

import Foundation

class LRUNode {
    var key: Int; var val: Int
    var prev: LRUNode?; var next: LRUNode?
    init(_ k: Int = 0, _ v: Int = 0) {
        // TODO: implement
    }
}

class LRUCache {
    let cap: Int
    var map: [Int: LRUNode] = [:]
    let head = LRUNode()
    let tail = LRUNode()

    init(_ capacity: Int) {
        // TODO: implement
    }

    private func remove(_ n: LRUNode) {
        // TODO: implement
    }

    private func addFront(_ n: LRUNode) {
        // TODO: implement
    }

    func get(_ key: Int) -> Int {
        // TODO: implement
        return 0
    }

    func put(_ key: Int, _ value: Int) {
        // TODO: implement
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
