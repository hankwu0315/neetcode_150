// Problem: 0286. Walls and Gates
// Difficulty: Medium

import Foundation

let WG_INF = 2147483647

class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        if rooms.isEmpty || rooms[0].isEmpty { return }
        let m = rooms.count, n = rooms[0].count
        var q: [(Int, Int)] = []
        for i in 0..<m {
            for j in 0..<n {
                if rooms[i][j] == 0 { q.append((i, j)) }
            }
        }
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var head = 0
        while head < q.count {
            let p = q[head]; head += 1
            for d in dirs {
                let ni = p.0 + d.0, nj = p.1 + d.1
                if ni >= 0 && ni < m && nj >= 0 && nj < n && rooms[ni][nj] == WG_INF {
                    rooms[ni][nj] = rooms[p.0][p.1] + 1
                    q.append((ni, nj))
                }
            }
        }
    }
}

func checkGrid(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
var r: [[Int]] = [
    [WG_INF, -1, 0, WG_INF],
    [WG_INF, WG_INF, WG_INF, -1],
    [WG_INF, -1, WG_INF, -1],
    [0, -1, WG_INF, WG_INF],
]
sol.wallsAndGates(&r)
checkGrid(r, [
    [3, -1, 0, 1],
    [2, 2, 1, -1],
    [1, -1, 2, -1],
    [0, -1, 3, 4],
], "a")
var r2: [[Int]] = [[0]]; sol.wallsAndGates(&r2); checkGrid(r2, [[0]], "b")
var r3: [[Int]] = [[WG_INF]]; sol.wallsAndGates(&r3); checkGrid(r3, [[WG_INF]], "c")
var r4: [[Int]] = [[-1, WG_INF, 0]]; sol.wallsAndGates(&r4); checkGrid(r4, [[-1, 1, 0]], "d")
var r5: [[Int]] = []; sol.wallsAndGates(&r5); if !r5.isEmpty { fatalError("e") }
print("All tests passed!")
