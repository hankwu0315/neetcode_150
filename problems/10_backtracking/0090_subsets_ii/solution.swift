// Problem: 0090. Subsets II
// Difficulty: Medium

import Foundation

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let a = nums.sorted()
        let n = a.count
        var out: [[Int]] = []
        var path: [Int] = []
        func dfs(_ i: Int) {
            out.append(path)
            var j = i
            while j < n {
                if j > i && a[j] == a[j - 1] { j += 1; continue }
                path.append(a[j])
                dfs(j + 1)
                path.removeLast()
                j += 1
            }
        }
        dfs(0)
        return out
    }
}

func normSS(_ xs: [[Int]]) -> [[Int]] {
    var r = xs.map { $0.sorted() }
    r.sort { (a, b) in
        if a.count != b.count { return a.count < b.count }
        for i in 0..<a.count { if a[i] != b[i] { return a[i] < b[i] } }
        return false
    }
    return r
}

func checkSS(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if normSS(a) != normSS(e) { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkSS(sol.subsetsWithDup([1, 2, 2]),
        [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]], "a")
checkSS(sol.subsetsWithDup([0]), [[], [0]], "b")
checkSS(sol.subsetsWithDup([]), [[]], "c")
checkSS(sol.subsetsWithDup([1, 1]), [[], [1], [1, 1]], "d")
if sol.subsetsWithDup([1, 2, 2, 3]).count != 12 { fatalError("e") }
print("All tests passed!")
