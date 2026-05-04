// 0066. Plus One
import Foundation
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var d = digits
        var i = d.count - 1
        while i >= 0 {
            if d[i] < 9 { d[i] += 1; return d }
            d[i] = 0; i -= 1
        }
        return [1] + d
    }
}
let sol = Solution()
if sol.plusOne([1, 2, 3]) != [1, 2, 4] { fatalError("a") }
if sol.plusOne([4, 3, 2, 1]) != [4, 3, 2, 2] { fatalError("b") }
if sol.plusOne([9]) != [1, 0] { fatalError("c") }
if sol.plusOne([9, 9, 9]) != [1, 0, 0, 0] { fatalError("d") }
if sol.plusOne([0]) != [1] { fatalError("e") }
print("All tests passed!")
