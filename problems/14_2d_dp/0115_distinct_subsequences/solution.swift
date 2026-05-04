// 0115. Distinct Subsequences
import Foundation
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let a = Array(s), b = Array(t)
        let m = a.count, n = b.count
        if n > m { return 0 }
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        if m >= 1 {
            for i in 1...m {
                let hi = min(i, n)
                if hi >= 1 {
                    var j = hi
                    while j >= 1 { if a[i - 1] == b[j - 1] { dp[j] += dp[j - 1] }; j -= 1 }
                }
            }
        }
        return dp[n]
    }
}
let sol = Solution()
if sol.numDistinct("rabbbit", "rabbit") != 3 { fatalError("a") }
if sol.numDistinct("babgbag", "bag") != 5 { fatalError("b") }
if sol.numDistinct("", "") != 1 { fatalError("c") }
if sol.numDistinct("a", "a") != 1 { fatalError("d") }
if sol.numDistinct("a", "b") != 0 { fatalError("e") }
if sol.numDistinct("aaa", "a") != 3 { fatalError("f") }
print("All tests passed!")
