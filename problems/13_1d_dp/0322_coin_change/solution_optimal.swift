// 0322. Coin Change
import Foundation
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        let INF = amount + 1
        var dp = Array(repeating: INF, count: amount + 1)
        dp[0] = 0
        if amount >= 1 {
            for a in 1...amount {
                for c in coins where c <= a && dp[a - c] + 1 < dp[a] {
                    dp[a] = dp[a - c] + 1
                }
            }
        }
        return dp[amount] == INF ? -1 : dp[amount]
    }
}
let sol = Solution()
if sol.coinChange([1, 2, 5], 11) != 3 { fatalError("a") }
if sol.coinChange([2], 3) != -1 { fatalError("b") }
if sol.coinChange([1], 0) != 0 { fatalError("c") }
if sol.coinChange([1], 2) != 2 { fatalError("d") }
if sol.coinChange([186, 419, 83, 408], 6249) != 20 { fatalError("e") }
if sol.coinChange([2, 5, 10, 1], 27) != 4 { fatalError("f") }
print("All tests passed!")
