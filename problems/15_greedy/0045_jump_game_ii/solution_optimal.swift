// 0045. Jump Game II
import Foundation
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0, end = 0, farthest = 0
        if nums.count <= 1 { return 0 }
        for i in 0..<(nums.count - 1) {
            if i + nums[i] > farthest { farthest = i + nums[i] }
            if i == end { jumps += 1; end = farthest }
        }
        return jumps
    }
}
let sol = Solution()
if sol.jump([2, 3, 1, 1, 4]) != 2 { fatalError("a") }
if sol.jump([2, 3, 0, 1, 4]) != 2 { fatalError("b") }
if sol.jump([1]) != 0 { fatalError("c") }
if sol.jump([1, 2]) != 1 { fatalError("d") }
if sol.jump([1, 1, 1, 1]) != 3 { fatalError("e") }
if sol.jump([5, 1, 1, 1, 1]) != 1 { fatalError("f") }
print("All tests passed!")
