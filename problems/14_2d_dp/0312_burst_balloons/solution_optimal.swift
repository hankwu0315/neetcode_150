// 0312. Burst Balloons
import Foundation
class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        var a = [1]; a.append(contentsOf: nums); a.append(1)
        let n = a.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        if n >= 2 {
            for length in 2..<n {
                if length >= n { break }
                var l = 0
                while l + length < n {
                    let r = l + length
                    var best = 0
                    for k in (l + 1)..<r {
                        let v = dp[l][k] + dp[k][r] + a[l] * a[k] * a[r]
                        if v > best { best = v }
                    }
                    dp[l][r] = best
                    l += 1
                }
            }
        }
        return dp[0][n - 1]
    }
}
let sol = Solution()
if sol.maxCoins([3, 1, 5, 8]) != 167 { fatalError("a") }
if sol.maxCoins([1, 5]) != 10 { fatalError("b") }
if sol.maxCoins([5]) != 5 { fatalError("c") }
if sol.maxCoins([]) != 0 { fatalError("d") }
if sol.maxCoins([1, 2, 3]) != 12 { fatalError("e") }
if sol.maxCoins([7, 9, 8, 0, 7, 1, 3, 5, 5, 2]) != 1582 { fatalError("f") }
print("All tests passed!")
