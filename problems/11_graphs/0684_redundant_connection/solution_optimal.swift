// Problem: 0684. Redundant Connection
// Difficulty: Medium

import Foundation

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var parent = Array(0...n)
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
            if ra == rb { return [e[0], e[1]] }
            parent[ra] = rb
        }
        return []
    }
}

func checkArr(_ a: [Int], _ e: [Int], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkArr(sol.findRedundantConnection([[1, 2], [1, 3], [2, 3]]), [2, 3], "a")
checkArr(sol.findRedundantConnection([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]), [1, 4], "b")
checkArr(sol.findRedundantConnection([[1, 2], [2, 3], [3, 1]]), [3, 1], "c")
checkArr(sol.findRedundantConnection([[2, 1], [3, 1], [4, 2], [1, 4]]), [1, 4], "d")
checkArr(sol.findRedundantConnection([[1, 2], [1, 3], [3, 2]]), [3, 2], "e")
print("All tests passed!")
