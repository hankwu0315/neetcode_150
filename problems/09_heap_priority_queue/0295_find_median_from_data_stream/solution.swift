// Problem: 0295. Find Median from Data Stream
// Difficulty: Hard

import Foundation

struct MaxHeapMF {
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

struct MinHeapMF {
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

class MedianFinder {
    var lo = MaxHeapMF()
    var hi = MinHeapMF()
    init() {
        // TODO: implement
    }

    func addNum(_ num: Int) {
        // TODO: implement
    }

    func findMedian() -> Double {
        // TODO: implement
        return 0
    }
}

func checkD(_ a: Double, _ e: Double, _ msg: String) {
    if abs(a - e) > 1e-9 { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
