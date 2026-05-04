// Problem: 1584. Min Cost to Connect All Points
// Difficulty: Medium

import Foundation

struct MinHeap1584 {
    private var a: [(Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    mutating func push(_ v: (Int, Int)) { a.append(v); up(a.count - 1) }
    mutating func pop() -> (Int, Int) {
        let t = a[0]; let last = a.removeLast()
        if !a.isEmpty { a[0] = last; down(0) }
        return t
    }
    private mutating func up(_ i: Int) {
        // TODO: implement
    }
    private mutating func down(_ i: Int) {
        // TODO: implement
    }
}

class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
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
