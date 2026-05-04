// Problem: 0051. N-Queens
// Difficulty: Hard

import Foundation

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var out: [[String]] = []
        var cols = Set<Int>(), d1 = Set<Int>(), d2 = Set<Int>()
        var placed: [Int] = []
        func dfs(_ r: Int) {
            if r == n {
                var board: [String] = []
                for c in placed {
                    var row = [Character](repeating: ".", count: n)
                    row[c] = "Q"
                    board.append(String(row))
                }
                out.append(board)
                return
            }
            for c in 0..<n {
                if cols.contains(c) || d1.contains(r - c) || d2.contains(r + c) { continue }
                cols.insert(c); d1.insert(r - c); d2.insert(r + c)
                placed.append(c)
                dfs(r + 1)
                placed.removeLast()
                cols.remove(c); d1.remove(r - c); d2.remove(r + c)
            }
        }
        dfs(0)
        return out
    }
}

func eqBoards(_ a: [[String]], _ e: [[String]]) -> Bool {
    if a.count != e.count { return false }
    let sa = a.map { $0.joined(separator: "|") }.sorted()
    let sb = e.map { $0.joined(separator: "|") }.sorted()
    return sa == sb
}

let sol = Solution()
if !eqBoards(sol.solveNQueens(1), [["Q"]]) { fatalError("a") }
let r4 = sol.solveNQueens(4)
if r4.count != 2 { fatalError("b1") }
if !eqBoards(r4, [
    [".Q..", "...Q", "Q...", "..Q."],
    ["..Q.", "Q...", "...Q", ".Q.."],
]) { fatalError("b2") }
if sol.solveNQueens(5).count != 10 { fatalError("c") }
if sol.solveNQueens(6).count != 4 { fatalError("d") }
if !sol.solveNQueens(2).isEmpty { fatalError("e") }
print("All tests passed!")
