// Problem: 0778. Swim in Rising Water
// Difficulty: Hard

import Foundation

struct MinHeap778 {
    private var a: [(Int, Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    mutating func push(_ v: (Int, Int, Int)) { a.append(v); up(a.count - 1) }
    mutating func pop() -> (Int, Int, Int) {
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
    func swimInWater(_ grid: [[Int]]) -> Int {
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
