// 0213. House Robber II
import Foundation
class Solution {
    private func linear(_ a: [Int], _ lo: Int, _ hi: Int) -> Int {
        var p2 = 0, p1 = 0
        for i in lo..<hi { let cur = max(p1, p2 + a[i]); p2 = p1; p1 = cur }
        return p1
    }
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }
        return max(linear(nums, 1, nums.count), linear(nums, 0, nums.count - 1))
    }
}
let sol = Solution()
if sol.rob([2, 3, 2]) != 3 { fatalError("a") }
if sol.rob([1, 2, 3, 1]) != 4 { fatalError("b") }
if sol.rob([1, 2, 3]) != 3 { fatalError("c") }
if sol.rob([]) != 0 { fatalError("d") }
if sol.rob([5]) != 5 { fatalError("e") }
if sol.rob([1, 2]) != 2 { fatalError("f") }
print("All tests passed!")
