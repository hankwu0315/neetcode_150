// Problem: 0994. Rotting Oranges
// Difficulty: Medium

import Foundation

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        var g = grid
        let m = g.count, n = g[0].count
        var q: [(Int, Int)] = []
        var fresh = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 2 { q.append((i, j)) }
                else if g[i][j] == 1 { fresh += 1 }
            }
        }
        if fresh == 0 { return 0 }
        var mins = 0
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var head = 0
        while head < q.count {
            var spread = false
            let sz = q.count
            while head < sz {
                let p = q[head]; head += 1
                for d in dirs {
                    let ni = p.0 + d.0, nj = p.1 + d.1
                    if ni >= 0 && ni < m && nj >= 0 && nj < n && g[ni][nj] == 1 {
                        g[ni][nj] = 2
                        fresh -= 1
                        q.append((ni, nj))
                        spread = true
                    }
                }
            }
            if spread { mins += 1 }
        }
        return fresh == 0 ? mins : -1
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.orangesRotting([[2, 1, 1], [1, 1, 0], [0, 1, 1]]), 4, "a")
checkInt(sol.orangesRotting([[2, 1, 1], [0, 1, 1], [1, 0, 1]]), -1, "b")
checkInt(sol.orangesRotting([[0, 2]]), 0, "c")
checkInt(sol.orangesRotting([[0]]), 0, "d")
checkInt(sol.orangesRotting([[1]]), -1, "e")
checkInt(sol.orangesRotting([[2, 2], [1, 1], [0, 0], [2, 0]]), 1, "f")
print("All tests passed!")
