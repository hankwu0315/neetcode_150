// Problem: 0703. Kth Largest Element in a Stream
// Difficulty: Easy

import Foundation

struct MinHeap {
    var a: [Int] = []
    var count: Int { a.count }
    var top: Int { a[0] }
    mutating func push(_ x: Int) {
        // TODO: implement
    }
    @discardableResult
    mutating func pop() -> Int {
        // TODO: implement
        return 0
    }
}

class KthLargest {
    let k: Int
    var h = MinHeap()
    init(_ k: Int, _ nums: [Int]) {
        // TODO: implement
    }
    func add(_ val: Int) -> Int {
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
