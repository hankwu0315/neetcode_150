// Problem: 0200. Number of Islands
// Difficulty: Medium

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        var g = grid
        let m = g.count, n = g[0].count
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= m || j < 0 || j >= n || g[i][j] != "1" { return }
            g[i][j] = "0"
            dfs(i + 1, j); dfs(i - 1, j); dfs(i, j + 1); dfs(i, j - 1)
        }
        var cnt = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == "1" { cnt += 1; dfs(i, j) }
            }
        }
        return cnt
    }
}

func gC(_ rows: [String]) -> [[Character]] {
    return rows.map { Array($0) }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.numIslands(gC(["110", "100", "001"])), 2, "a")
checkInt(sol.numIslands(gC(["11110", "11010", "11000", "00000"])), 1, "b")
checkInt(sol.numIslands(gC(["11000", "11000", "00100", "00011"])), 3, "c")
checkInt(sol.numIslands([]), 0, "d")
checkInt(sol.numIslands(gC(["0"])), 0, "e")
checkInt(sol.numIslands(gC(["1"])), 1, "f")
print("All tests passed!")
