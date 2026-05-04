// Problem: 0133. Clone Graph
// Difficulty: Medium

import Foundation

class GNode {
    var val: Int
    var neighbors: [GNode]
    init(_ v: Int, _ nbs: [GNode] = []) {
        // TODO: implement
    }
}

class Solution {
    func cloneGraph(_ node: GNode?) -> GNode? {
        // TODO: implement
        return nil
    }
}

func buildG(_ adj: [[Int]]) -> GNode? {
    // TODO: implement
    return nil
}

func adjOf(_ root: GNode?) -> [[Int]] {
    // TODO: implement
    return []
}

func checkArr2(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
