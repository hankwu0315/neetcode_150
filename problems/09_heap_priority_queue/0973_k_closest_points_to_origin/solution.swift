// Problem: 0973. K Closest Points to Origin
// Difficulty: Medium

import Foundation

struct PQEntry {
    let d: Int; let x: Int; let y: Int
}

struct PQ {
    var a: [PQEntry] = []
    var count: Int { a.count }
    mutating func push(_ e: PQEntry) {
        // TODO: implement
    }
    @discardableResult
    mutating func pop() -> PQEntry {
        // TODO: implement
        return nil
    }
}

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        // TODO: implement
        return []
    }
}

func norm(_ a: [[Int]]) -> [[Int]] {
    // TODO: implement
    return []
}

func checkArr(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    let an = norm(a), en = norm(e)
    if an.count != en.count { fatalError("FAIL \(msg): \(an) vs \(en)") }
    for i in 0..<an.count {
        if an[i] != en[i] { fatalError("FAIL \(msg): \(an) vs \(en)") }
    }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
