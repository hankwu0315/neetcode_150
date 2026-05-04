// 0338. Counting Bits
import Foundation
class Solution {
    func countBits(_ n: Int) -> [Int] {
        var dp = Array(repeating: 0, count: n + 1)
        if n >= 1 {
            for i in 1...n { dp[i] = dp[i >> 1] + (i & 1) }
        }
        return dp
    }
}
let sol = Solution()
if sol.countBits(2) != [0, 1, 1] { fatalError("a") }
if sol.countBits(5) != [0, 1, 1, 2, 1, 2] { fatalError("b") }
if sol.countBits(0) != [0] { fatalError("c") }
if sol.countBits(8) != [0, 1, 1, 2, 1, 2, 2, 3, 1] { fatalError("d") }
print("All tests passed!")
