// Problem: 0046. Permutations
// Difficulty: Medium

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var out: [[Int]] = []
        var path: [Int] = []
        var used = [Bool](repeating: false, count: n)
        func dfs() {
            if path.count == n { out.append(path); return }
            for i in 0..<n {
                if used[i] { continue }
                used[i] = true
                path.append(nums[i])
                dfs()
                path.removeLast()
                used[i] = false
            }
        }
        dfs()
        return out
    }
}

func sortLL(_ xs: [[Int]]) -> [[Int]] {
    return xs.sorted { (a, b) in
        let n = min(a.count, b.count)
        for i in 0..<n { if a[i] != b[i] { return a[i] < b[i] } }
        return a.count < b.count
    }
}

func checkLL(_ a: [[Int]], _ e: [[Int]], _ msg: String) {
    if sortLL(a) != sortLL(e) { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkLL(sol.permute([1, 2, 3]),
        [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]], "a")
checkLL(sol.permute([0, 1]), [[0, 1], [1, 0]], "b")
checkLL(sol.permute([1]), [[1]], "c")
if sol.permute([1, 2, 3, 4]).count != 24 { fatalError("d") }
checkLL(sol.permute([7, 8]), [[7, 8], [8, 7]], "e")
print("All tests passed!")
