// 0062. Unique Paths
import Foundation
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n)
        if m > 1 {
            for _ in 1..<m { for j in 1..<n { dp[j] += dp[j - 1] } }
        }
        return dp[n - 1]
    }
}
let sol = Solution()
if sol.uniquePaths(3, 7) != 28 { fatalError("a") }
if sol.uniquePaths(3, 2) != 3 { fatalError("b") }
if sol.uniquePaths(7, 3) != 28 { fatalError("c") }
if sol.uniquePaths(1, 1) != 1 { fatalError("d") }
if sol.uniquePaths(1, 10) != 1 { fatalError("e") }
if sol.uniquePaths(10, 10) != 48620 { fatalError("f") }
print("All tests passed!")
