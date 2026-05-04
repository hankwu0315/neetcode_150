// Problem: 0323. Number of Connected Components in an Undirected Graph
// Difficulty: Medium

import Foundation

class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var parent = Array(0..<n)
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        var comps = n
        for e in edges {
            let ra = find(e[0]), rb = find(e[1])
            if ra != rb { parent[ra] = rb; comps -= 1 }
        }
        return comps
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.countComponents(5, [[0, 1], [1, 2], [3, 4]]), 2, "a")
checkInt(sol.countComponents(5, [[0, 1], [1, 2], [2, 3], [3, 4]]), 1, "b")
checkInt(sol.countComponents(4, []), 4, "c")
checkInt(sol.countComponents(1, []), 1, "d")
checkInt(sol.countComponents(6, [[0, 1], [2, 3], [4, 5]]), 3, "e")
checkInt(sol.countComponents(4, [[0, 1], [1, 2], [0, 2]]), 2, "f")
print("All tests passed!")
