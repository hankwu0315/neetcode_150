// 0329. Longest Increasing Path in a Matrix
import Foundation
class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        let m = matrix.count, n = matrix[0].count
        var memo = Array(repeating: Array(repeating: 0, count: n), count: m)
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        func dfs(_ i: Int, _ j: Int) -> Int {
            if memo[i][j] != 0 { return memo[i][j] }
            var best = 1
            for d in dirs {
                let ni = i + d.0, nj = j + d.1
                if ni >= 0 && ni < m && nj >= 0 && nj < n && matrix[ni][nj] > matrix[i][j] {
                    let v = 1 + dfs(ni, nj)
                    if v > best { best = v }
                }
            }
            memo[i][j] = best
            return best
        }
        var ans = 0
        for i in 0..<m { for j in 0..<n {
            let v = dfs(i, j); if v > ans { ans = v }
        } }
        return ans
    }
}
let sol = Solution()
if sol.longestIncreasingPath([[9, 9, 4], [6, 6, 8], [2, 1, 1]]) != 4 { fatalError("a") }
if sol.longestIncreasingPath([[3, 4, 5], [3, 2, 6], [2, 2, 1]]) != 4 { fatalError("b") }
if sol.longestIncreasingPath([[1]]) != 1 { fatalError("c") }
if sol.longestIncreasingPath([[]]) != 0 { fatalError("d") }
if sol.longestIncreasingPath([[1, 2]]) != 2 { fatalError("e") }
if sol.longestIncreasingPath([[7, 7, 7], [7, 7, 7]]) != 1 { fatalError("f") }
print("All tests passed!")
