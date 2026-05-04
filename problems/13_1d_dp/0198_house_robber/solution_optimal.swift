// 0198. House Robber
import Foundation
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var p2 = 0, p1 = 0
        for x in nums { let cur = max(p1, p2 + x); p2 = p1; p1 = cur }
        return p1
    }
}
let sol = Solution()
if sol.rob([1, 2, 3, 1]) != 4 { fatalError("a") }
if sol.rob([2, 7, 9, 3, 1]) != 12 { fatalError("b") }
if sol.rob([]) != 0 { fatalError("c") }
if sol.rob([5]) != 5 { fatalError("d") }
if sol.rob([2, 1]) != 2 { fatalError("e") }
if sol.rob([2, 1, 1, 2]) != 4 { fatalError("f") }
print("All tests passed!")
