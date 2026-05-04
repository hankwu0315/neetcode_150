// 0097. Interleaving String
import Foundation
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let a = Array(s1), b = Array(s2), c = Array(s3)
        let m = a.count, n = b.count
        if m + n != c.count { return false }
        var dp = Array(repeating: false, count: n + 1)
        dp[0] = true
        if n >= 1 { for j in 1...n { dp[j] = dp[j - 1] && b[j - 1] == c[j - 1] } }
        if m >= 1 {
            for i in 1...m {
                dp[0] = dp[0] && a[i - 1] == c[i - 1]
                if n >= 1 {
                    for j in 1...n {
                        dp[j] = (dp[j] && a[i - 1] == c[i + j - 1]) ||
                                (dp[j - 1] && b[j - 1] == c[i + j - 1])
                    }
                }
            }
        }
        return dp[n]
    }
}
let sol = Solution()
if sol.isInterleave("aabcc", "dbbca", "aadbbcbcac") != true { fatalError("a") }
if sol.isInterleave("aabcc", "dbbca", "aadbbbaccc") != false { fatalError("b") }
if sol.isInterleave("", "", "") != true { fatalError("c") }
if sol.isInterleave("", "abc", "abc") != true { fatalError("d") }
if sol.isInterleave("a", "", "a") != true { fatalError("e") }
if sol.isInterleave("a", "b", "ab") != true { fatalError("f") }
if sol.isInterleave("a", "b", "ba") != true { fatalError("g") }
print("All tests passed!")
