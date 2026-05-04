// Problem: 0261. Graph Valid Tree
// Difficulty: Medium

import Foundation

class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n - 1 { return false }
        var parent = Array(0..<n)
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        for e in edges {
            let ra = find(e[0]), rb = find(e[1])
            if ra == rb { return false }
            parent[ra] = rb
        }
        return true
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkBool(sol.validTree(5, [[0, 1], [0, 2], [0, 3], [1, 4]]), true, "a")
checkBool(sol.validTree(5, [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]), false, "b")
checkBool(sol.validTree(1, []), true, "c")
checkBool(sol.validTree(2, [[0, 1]]), true, "d")
checkBool(sol.validTree(4, [[0, 1], [2, 3]]), false, "e")
checkBool(sol.validTree(3, [[0, 1], [0, 2], [1, 2]]), false, "f")
print("All tests passed!")
