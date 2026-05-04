// 1143. Longest Common Subsequence
import Foundation
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let a = Array(text1), b = Array(text2)
        let m = a.count, n = b.count
        var prev = Array(repeating: 0, count: n + 1)
        if m == 0 || n == 0 { return 0 }
        for i in 1...m {
            var cur = Array(repeating: 0, count: n + 1)
            for j in 1...n {
                if a[i - 1] == b[j - 1] {
                    cur[j] = prev[j - 1] + 1
                } else {
                    cur[j] = max(prev[j], cur[j - 1])
                }
            }
            prev = cur
        }
        return prev[n]
    }
}
let sol = Solution()
if sol.longestCommonSubsequence("abcde", "ace") != 3 { fatalError("a") }
if sol.longestCommonSubsequence("abc", "abc") != 3 { fatalError("b") }
if sol.longestCommonSubsequence("abc", "def") != 0 { fatalError("c") }
if sol.longestCommonSubsequence("", "abc") != 0 { fatalError("d") }
if sol.longestCommonSubsequence("bsbininm", "jmjkbkjkv") != 1 { fatalError("e") }
if sol.longestCommonSubsequence("ezupkr", "ubmrapg") != 2 { fatalError("f") }
print("All tests passed!")
