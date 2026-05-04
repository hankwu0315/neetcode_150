// Problem: 0695. Max Area of Island
// Difficulty: Medium

import Foundation

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        var g = grid
        let m = g.count, n = g[0].count
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i < 0 || i >= m || j < 0 || j >= n || g[i][j] != 1 { return 0 }
            g[i][j] = 0
            return 1 + dfs(i + 1, j) + dfs(i - 1, j) + dfs(i, j + 1) + dfs(i, j - 1)
        }
        var best = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 1 { best = max(best, dfs(i, j)) }
            }
        }
        return best
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
let g1: [[Int]] = [
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
]
checkInt(sol.maxAreaOfIsland(g1), 6, "a")
checkInt(sol.maxAreaOfIsland([[0, 0, 0, 0, 0, 0, 0, 0]]), 0, "b")
checkInt(sol.maxAreaOfIsland([[1]]), 1, "c")
checkInt(sol.maxAreaOfIsland([[1, 1], [1, 1]]), 4, "d")
checkInt(sol.maxAreaOfIsland([[0, 1, 0], [1, 1, 1], [0, 1, 0]]), 5, "e")
print("All tests passed!")
