// 0309. Best Time to Buy and Sell Stock with Cooldown
import Foundation
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 }
        var hold = -prices[0], sold = 0, rest = 0
        for i in 1..<prices.count {
            let p = prices[i]
            let nh = max(hold, rest - p)
            let ns = hold + p
            let nr = max(rest, sold)
            hold = nh; sold = ns; rest = nr
        }
        return max(sold, rest)
    }
}
let sol = Solution()
if sol.maxProfit([1, 2, 3, 0, 2]) != 3 { fatalError("a") }
if sol.maxProfit([1]) != 0 { fatalError("b") }
if sol.maxProfit([]) != 0 { fatalError("c") }
if sol.maxProfit([1, 2, 4]) != 3 { fatalError("d") }
if sol.maxProfit([6, 1, 3, 2, 4, 7]) != 6 { fatalError("e") }
if sol.maxProfit([2, 1]) != 0 { fatalError("f") }
print("All tests passed!")
