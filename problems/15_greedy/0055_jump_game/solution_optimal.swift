// 0055. Jump Game
import Foundation
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        for i in 0..<nums.count {
            if i > reach { return false }
            if i + nums[i] > reach { reach = i + nums[i] }
        }
        return true
    }
}
let sol = Solution()
if sol.canJump([2, 3, 1, 1, 4]) != true { fatalError("a") }
if sol.canJump([3, 2, 1, 0, 4]) != false { fatalError("b") }
if sol.canJump([0]) != true { fatalError("c") }
if sol.canJump([2, 0]) != true { fatalError("d") }
if sol.canJump([1, 0, 1]) != false { fatalError("e") }
if sol.canJump([2, 0, 0]) != true { fatalError("f") }
print("All tests passed!")
