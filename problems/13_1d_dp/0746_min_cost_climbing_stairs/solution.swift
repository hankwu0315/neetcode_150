// 0746. Min Cost Climbing Stairs
import Foundation
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var a = 0, b = 0
        for i in 2...cost.count {
            let c = min(b + cost[i - 1], a + cost[i - 2])
            a = b; b = c
        }
        return b
    }
}
let sol = Solution()
if sol.minCostClimbingStairs([10, 15, 20]) != 15 { fatalError("a") }
if sol.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) != 6 { fatalError("b") }
if sol.minCostClimbingStairs([0, 0]) != 0 { fatalError("c") }
if sol.minCostClimbingStairs([1, 2]) != 1 { fatalError("d") }
if sol.minCostClimbingStairs([10, 15]) != 10 { fatalError("e") }
if sol.minCostClimbingStairs([0, 1, 2, 2]) != 2 { fatalError("f") }
print("All tests passed!")
