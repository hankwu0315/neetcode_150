// 0136. Single Number
import Foundation
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var x = 0
        for v in nums { x ^= v }
        return x
    }
}
let sol = Solution()
if sol.singleNumber([2, 2, 1]) != 1 { fatalError("a") }
if sol.singleNumber([4, 1, 2, 1, 2]) != 4 { fatalError("b") }
if sol.singleNumber([1]) != 1 { fatalError("c") }
if sol.singleNumber([7, 3, 5, 4, 5, 3, 4]) != 7 { fatalError("d") }
print("All tests passed!")
