// Problem: 0039. Combination Sum
// Difficulty: Medium

import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let c = candidates.sorted()
        var out: [[Int]] = []
        var path: [Int] = []
        func dfs(_ i: Int, _ remain: Int) {
            if remain == 0 { out.append(path); return }
            var j = i
            while j < c.count {
                if c[j] > remain { break }
                path.append(c[j])
                dfs(j, remain - c[j])
                path.removeLast()
                j += 1
            }
        }
        dfs(0, target)
        return out
    }
}

func normCS(_ xs: [[Int]]) -> [[Int]] {
    var r = xs.map { $0.sorted() }
    r.sort { (a, b) in
        if a.count != b.count { return a.count < b.count }
        for i in 0..<a.count { if a[i] != b[i] { return a[i] < b[i] } }
        return false
    }
    return r
}

func checkCS(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if normCS(a) != normCS(e) { fatalError("FAIL \(msg): \(normCS(a)) vs \(normCS(e))") }
}

let sol = Solution()
checkCS(sol.combinationSum([2, 3, 6, 7], 7), [[2, 2, 3], [7]], "a")
checkCS(sol.combinationSum([2, 3, 5], 8), [[2, 2, 2, 2], [2, 3, 3], [3, 5]], "b")
if !sol.combinationSum([2], 1).isEmpty { fatalError("c") }
checkCS(sol.combinationSum([1], 2), [[1, 1]], "d")
checkCS(sol.combinationSum([8, 7, 4, 3], 11), [[3, 4, 4], [3, 8], [4, 7]], "e")
print("All tests passed!")
