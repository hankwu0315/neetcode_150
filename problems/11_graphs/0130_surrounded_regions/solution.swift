// Problem: 0130. Surrounded Regions
// Difficulty: Medium

import Foundation

class Solution {
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty || board[0].isEmpty { return }
        let m = board.count, n = board[0].count
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= m || j < 0 || j >= n || board[i][j] != "O" { return }
            board[i][j] = "#"
            dfs(i + 1, j); dfs(i - 1, j); dfs(i, j + 1); dfs(i, j - 1)
        }
        for i in 0..<m { dfs(i, 0); dfs(i, n - 1) }
        for j in 0..<n { dfs(0, j); dfs(m - 1, j) }
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" { board[i][j] = "X" }
                else if board[i][j] == "#" { board[i][j] = "O" }
            }
        }
    }
}

func gC(_ rows: [String]) -> [[Character]] { return rows.map { Array($0) } }

func checkG(_ a: [[Character]], _ e: [[Character]], _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
var b = gC(["XXXX", "XOOX", "XXOX", "XOXX"])
sol.solve(&b); checkG(b, gC(["XXXX", "XXXX", "XXXX", "XOXX"]), "a")
var b2 = gC(["X"]); sol.solve(&b2); checkG(b2, gC(["X"]), "b")
var b3 = gC(["OO", "OO"]); sol.solve(&b3); checkG(b3, gC(["OO", "OO"]), "c")
var b4 = gC(["XXX", "XOX", "XXX"]); sol.solve(&b4); checkG(b4, gC(["XXX", "XXX", "XXX"]), "d")
var b5 = gC(["OXXO", "XOOX", "XOOX", "OXXO"]); sol.solve(&b5)
checkG(b5, gC(["OXXO", "XXXX", "XXXX", "OXXO"]), "e")
print("All tests passed!")
