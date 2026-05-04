// 0053. Maximum Subarray
import Foundation
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var cur = nums[0], best = nums[0]
        for i in 1..<nums.count {
            cur = max(nums[i], cur + nums[i])
            if cur > best { best = cur }
        }
        return best
    }
}
let sol = Solution()
if sol.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) != 6 { fatalError("a") }
if sol.maxSubArray([1]) != 1 { fatalError("b") }
if sol.maxSubArray([5, 4, -1, 7, 8]) != 23 { fatalError("c") }
if sol.maxSubArray([-1]) != -1 { fatalError("d") }
if sol.maxSubArray([-2, -1]) != -1 { fatalError("e") }
if sol.maxSubArray([1, 2, 3, 4]) != 10 { fatalError("f") }
print("All tests passed!")
