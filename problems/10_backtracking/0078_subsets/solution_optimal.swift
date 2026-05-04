// Problem: 0078. Subsets
// Difficulty: Medium

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var out: [[Int]] = []
        var path: [Int] = []
        let n = nums.count
        func dfs(_ i: Int) {
            if i == n { out.append(path); return }
            dfs(i + 1)
            path.append(nums[i])
            dfs(i + 1)
            path.removeLast()
        }
        dfs(0)
        return out
    }
}

func normalize(_ xs: [[Int]]) -> [[Int]] {
    var r = xs.map { $0.sorted() }
    r.sort { (a, b) in
        if a.count != b.count { return a.count < b.count }
        for i in 0..<a.count { if a[i] != b[i] { return a[i] < b[i] } }
        return false
    }
    return r
}

func checkSets(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    let na = normalize(a), ne = normalize(e)
    if na != ne { fatalError("FAIL \(msg): \(na) vs \(ne)") }
}

let sol = Solution()
checkSets(sol.subsets([1, 2, 3]),
          [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]], "a")
checkSets(sol.subsets([0]), [[], [0]], "b")
checkSets(sol.subsets([]), [[]], "c")
if sol.subsets([1, 2, 3, 4]).count != 16 { fatalError("d") }
checkSets(sol.subsets([5, 6]), [[], [5], [6], [5, 6]], "e")
print("All tests passed!")
