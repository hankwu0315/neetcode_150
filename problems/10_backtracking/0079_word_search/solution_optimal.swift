// Problem: 0079. Word Search
// Difficulty: Medium

import Foundation

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var b = board
        let w = Array(word)
        let m = b.count, n = b[0].count, L = w.count
        func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
            if k == L { return true }
            if i < 0 || i >= m || j < 0 || j >= n || b[i][j] != w[k] { return false }
            let tmp = b[i][j]
            b[i][j] = "#"
            let ok = dfs(i + 1, j, k + 1) || dfs(i - 1, j, k + 1)
                  || dfs(i, j + 1, k + 1) || dfs(i, j - 1, k + 1)
            b[i][j] = tmp
            return ok
        }
        for i in 0..<m {
            for j in 0..<n {
                if b[i][j] == w[0] && dfs(i, j, 0) { return true }
            }
        }
        return false
    }
}

func checkBool(_ a: Bool, _ e: Bool, _ msg: String) {
    if a != e { fatalError("FAIL \(msg)") }
}

let sol = Solution()
let b1: [[Character]] = [
    ["A", "B", "C", "E"],
    ["S", "F", "C", "S"],
    ["A", "D", "E", "E"],
]
checkBool(sol.exist(b1, "ABCCED"), true, "a")
checkBool(sol.exist(b1, "SEE"), true, "b")
checkBool(sol.exist(b1, "ABCB"), false, "c")
checkBool(sol.exist([["A"]], "A"), true, "d")
checkBool(sol.exist([["A"]], "B"), false, "e")
print("All tests passed!")
