// 0010. Regular Expression Matching
import Foundation
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let a = Array(s), pp = Array(p)
        let m = a.count, n = pp.count
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        if n >= 1 { for j in 1...n { if pp[j - 1] == "*" { dp[0][j] = dp[0][j - 2] } } }
        if m >= 1 && n >= 1 {
            for i in 1...m {
                for j in 1...n {
                    if pp[j - 1] == "*" {
                        dp[i][j] = dp[i][j - 2]
                        if pp[j - 2] == "." || pp[j - 2] == a[i - 1] {
                            dp[i][j] = dp[i][j] || dp[i - 1][j]
                        }
                    } else if pp[j - 1] == "." || pp[j - 1] == a[i - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    }
                }
            }
        }
        return dp[m][n]
    }
}
let sol = Solution()
if sol.isMatch("aa", "a") != false { fatalError("a") }
if sol.isMatch("aa", "a*") != true { fatalError("b") }
if sol.isMatch("ab", ".*") != true { fatalError("c") }
if sol.isMatch("aab", "c*a*b") != true { fatalError("d") }
if sol.isMatch("mississippi", "mis*is*p*.") != false { fatalError("e") }
if sol.isMatch("", "") != true { fatalError("f") }
if sol.isMatch("", ".*") != true { fatalError("g") }
if sol.isMatch("a", "ab*") != true { fatalError("h") }
print("All tests passed!")
