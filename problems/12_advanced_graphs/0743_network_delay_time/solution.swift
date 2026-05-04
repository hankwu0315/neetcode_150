// Problem: 0743. Network Delay Time
// Difficulty: Medium

import Foundation

struct MinHeap743 {
    private var a: [(Int, Int)] = []
    var isEmpty: Bool { a.isEmpty }
    mutating func push(_ v: (Int, Int)) { a.append(v); siftUp(a.count - 1) }
    mutating func pop() -> (Int, Int) {
        let top = a[0]
        let last = a.removeLast()
        if !a.isEmpty { a[0] = last; siftDown(0) }
        return top
    }
    private mutating func siftUp(_ i: Int) {
        // TODO: implement
    }
    private mutating func siftDown(_ i: Int) {
        // TODO: implement
    }
}

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
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
