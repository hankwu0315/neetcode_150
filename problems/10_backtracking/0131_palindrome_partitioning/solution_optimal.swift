// Problem: 0131. Palindrome Partitioning
// Difficulty: Medium

import Foundation

class Solution {
    func partition(_ s: String) -> [[String]] {
        let arr = Array(s)
        let n = arr.count
        var out: [[String]] = []
        var path: [String] = []
        func isPal(_ l: Int, _ r: Int) -> Bool {
            var l = l, r = r
            while l < r {
                if arr[l] != arr[r] { return false }
                l += 1; r -= 1
            }
            return true
        }
        func dfs(_ start: Int) {
            if start == n { out.append(path); return }
            for end in start..<n {
                if isPal(start, end) {
                    path.append(String(arr[start...end]))
                    dfs(end + 1)
                    path.removeLast()
                }
            }
        }
        dfs(0)
        return out
    }
}

func normLLS(_ xs: [[String]]) -> [[String]] {
    return xs.sorted { (a, b) in
        let n = min(a.count, b.count)
        for i in 0..<n { if a[i] != b[i] { return a[i] < b[i] } }
        return a.count < b.count
    }
}

func checkLLS(_ a: [[String]], _ e: [[String]], _ msg: String) {
    if normLLS(a) != normLLS(e) { fatalError("FAIL \(msg)") }
}

let sol = Solution()
checkLLS(sol.partition("aab"), [["a", "a", "b"], ["aa", "b"]], "a")
checkLLS(sol.partition("a"), [["a"]], "b")
checkLLS(sol.partition("aa"), [["a", "a"], ["aa"]], "c")
checkLLS(sol.partition("aba"), [["a", "b", "a"], ["aba"]], "d")
if sol.partition("efe").count != 2 { fatalError("e") }
print("All tests passed!")
