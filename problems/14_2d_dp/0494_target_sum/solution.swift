// 0494. Target Sum
import Foundation
class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let s = nums.reduce(0, +)
        if abs(target) > s || (s + target) % 2 != 0 { return 0 }
        let p = (s + target) / 2
        var dp = Array(repeating: 0, count: p + 1)
        dp[0] = 1
        for x in nums {
            if x > p { continue }
            var v = p
            while v >= x { dp[v] += dp[v - x]; v -= 1 }
        }
        return dp[p]
    }
}
let sol = Solution()
if sol.findTargetSumWays([1, 1, 1, 1, 1], 3) != 5 { fatalError("a") }
if sol.findTargetSumWays([1], 1) != 1 { fatalError("b") }
if sol.findTargetSumWays([1], 2) != 0 { fatalError("c") }
if sol.findTargetSumWays([0, 0, 0, 0, 0, 0, 0, 0, 1], 1) != 256 { fatalError("d") }
if sol.findTargetSumWays([1, 2, 3], 0) != 2 { fatalError("e") }
if sol.findTargetSumWays([100], -200) != 0 { fatalError("f") }
print("All tests passed!")
