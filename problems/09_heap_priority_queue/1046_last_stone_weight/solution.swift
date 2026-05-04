// Problem: 1046. Last Stone Weight
// Difficulty: Easy

import Foundation

struct MaxHeap {
    var a: [Int] = []
    var count: Int { a.count }
    mutating func push(_ x: Int) {
        // TODO: implement
    }
    @discardableResult
    mutating func pop() -> Int {
        // TODO: implement
        return 0
    }
}

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        // TODO: implement
        return 0
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
