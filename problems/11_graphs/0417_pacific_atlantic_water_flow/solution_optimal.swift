// Problem: 0417. Pacific Atlantic Water Flow
// Difficulty: Medium

import Foundation

class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        if heights.isEmpty || heights[0].isEmpty { return [] }
        let m = heights.count, n = heights[0].count
        var pac = Array(repeating: Array(repeating: false, count: n), count: m)
        var atl = Array(repeating: Array(repeating: false, count: n), count: m)
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        func dfs(_ i: Int, _ j: Int, _ vis: inout [[Bool]]) {
            vis[i][j] = true
            for d in dirs {
                let ni = i + d.0, nj = j + d.1
                if ni >= 0 && ni < m && nj >= 0 && nj < n &&
                    !vis[ni][nj] && heights[ni][nj] >= heights[i][j] {
                    dfs(ni, nj, &vis)
                }
            }
        }
        for i in 0..<m { dfs(i, 0, &pac); dfs(i, n - 1, &atl) }
        for j in 0..<n { dfs(0, j, &pac); dfs(m - 1, j, &atl) }
        var res: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                if pac[i][j] && atl[i][j] { res.append([i, j]) }
            }
        }
        return res
    }
}

func normPA(_ a: [[Int]]) -> [[Int]] {
    return a.sorted { x, y in
        if x[0] != y[0] { return x[0] < y[0] }
        return x[1] < y[1]
    }
}

func checkArr2(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
let h1 = [
    [1, 2, 2, 3, 5],
    [3, 2, 3, 4, 4],
    [2, 4, 5, 3, 1],
    [6, 7, 1, 4, 5],
    [5, 1, 1, 2, 4],
]
let exp1 = [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]]
checkArr2(normPA(sol.pacificAtlantic(h1)), normPA(exp1), "a")
checkArr2(sol.pacificAtlantic([[1]]), [[0, 0]], "b")
checkArr2(normPA(sol.pacificAtlantic([[1, 1], [1, 1]])),
          normPA([[0, 0], [0, 1], [1, 0], [1, 1]]), "c")
if !sol.pacificAtlantic([]).isEmpty { fatalError("d") }
let h2 = [[3, 3, 3], [3, 1, 3], [0, 3, 3]]
let exp2 = [[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]]
checkArr2(normPA(sol.pacificAtlantic(h2)), normPA(exp2), "e")
print("All tests passed!")
