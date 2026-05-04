// 0518. Coin Change II
import Foundation
class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1
        for c in coins {
            if c > amount { continue }
            for a in c...amount { dp[a] += dp[a - c] }
        }
        return dp[amount]
    }
}
let sol = Solution()
if sol.change(5, [1, 2, 5]) != 4 { fatalError("a") }
if sol.change(3, [2]) != 0 { fatalError("b") }
if sol.change(10, [10]) != 1 { fatalError("c") }
if sol.change(0, [1, 2]) != 1 { fatalError("d") }
if sol.change(500, [1, 2, 5]) != 12701 { fatalError("e") }
if sol.change(7, [1, 5, 10]) != 2 { fatalError("f") }
print("All tests passed!")
