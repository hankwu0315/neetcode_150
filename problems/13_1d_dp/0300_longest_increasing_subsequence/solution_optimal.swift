// 0300. Longest Increasing Subsequence
import Foundation
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails: [Int] = []
        for x in nums {
            var lo = 0, hi = tails.count
            while lo < hi {
                let m = (lo + hi) >> 1
                if tails[m] < x { lo = m + 1 } else { hi = m }
            }
            if lo == tails.count { tails.append(x) } else { tails[lo] = x }
        }
        return tails.count
    }
}
let sol = Solution()
if sol.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]) != 4 { fatalError("a") }
if sol.lengthOfLIS([0, 1, 0, 3, 2, 3]) != 4 { fatalError("b") }
if sol.lengthOfLIS([7, 7, 7, 7]) != 1 { fatalError("c") }
if sol.lengthOfLIS([]) != 0 { fatalError("d") }
if sol.lengthOfLIS([1]) != 1 { fatalError("e") }
if sol.lengthOfLIS([4, 10, 4, 3, 8, 9]) != 3 { fatalError("f") }
print("All tests passed!")
