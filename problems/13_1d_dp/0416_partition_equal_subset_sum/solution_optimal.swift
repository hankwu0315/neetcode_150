// 0416. Partition Equal Subset Sum
import Foundation
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let s = nums.reduce(0, +)
        if s % 2 != 0 { return false }
        let target = s / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for x in nums {
            if x > target { continue }
            var v = target
            while v >= x { if dp[v - x] { dp[v] = true }; v -= 1 }
        }
        return dp[target]
    }
}
let sol = Solution()
if sol.canPartition([1, 5, 11, 5]) != true { fatalError("a") }
if sol.canPartition([1, 2, 3, 5]) != false { fatalError("b") }
if sol.canPartition([1, 1]) != true { fatalError("c") }
if sol.canPartition([2, 2, 1, 1]) != true { fatalError("d") }
if sol.canPartition([1]) != false { fatalError("e") }
if sol.canPartition([100, 100, 100, 100, 100, 100, 100, 100]) != true { fatalError("f") }
print("All tests passed!")
