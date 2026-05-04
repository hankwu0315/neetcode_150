// Problem: 0040. Combination Sum II
// Difficulty: Medium

import Foundation

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let c = candidates.sorted()
        var out: [[Int]] = []
        var path: [Int] = []
        let n = c.count
        func dfs(_ i: Int, _ remain: Int) {
            if remain == 0 { out.append(path); return }
            var j = i
            while j < n {
                if j > i && c[j] == c[j - 1] { j += 1; continue }
                if c[j] > remain { break }
                path.append(c[j])
                dfs(j + 1, remain - c[j])
                path.removeLast()
                j += 1
            }
        }
        dfs(0, target)
        return out
    }
}

func normCS2(_ xs: [[Int]]) -> [[Int]] {
    var r = xs.map { $0.sorted() }
    r.sort { (a, b) in
        if a.count != b.count { return a.count < b.count }
        for i in 0..<a.count { if a[i] != b[i] { return a[i] < b[i] } }
        return false
    }
    return r
}

func checkCS2(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if normCS2(a) != normCS2(e) { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkCS2(sol.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8),
         [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]], "a")
checkCS2(sol.combinationSum2([2, 5, 2, 1, 2], 5), [[1, 2, 2], [5]], "b")
if !sol.combinationSum2([1, 1, 1], 5).isEmpty { fatalError("c") }
checkCS2(sol.combinationSum2([1, 1, 1], 2), [[1, 1]], "d")
checkCS2(sol.combinationSum2([4, 4, 2, 1, 4, 2, 2, 1, 3], 6),
         [[1, 1, 4], [1, 2, 3], [2, 4], [2, 2, 2], [1, 1, 2, 2]], "e")
print("All tests passed!")
