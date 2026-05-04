// 0152. Maximum Product Subarray
import Foundation
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var ans = nums[0], mx = nums[0], mn = nums[0]
        for i in 1..<nums.count {
            let x = nums[i]
            let a = x, b = x * mx, c = x * mn
            let nmx = max(a, max(b, c))
            let nmn = min(a, min(b, c))
            mx = nmx; mn = nmn
            if mx > ans { ans = mx }
        }
        return ans
    }
}
let sol = Solution()
if sol.maxProduct([2, 3, -2, 4]) != 6 { fatalError("a") }
if sol.maxProduct([-2, 0, -1]) != 0 { fatalError("b") }
if sol.maxProduct([-2, 3, -4]) != 24 { fatalError("c") }
if sol.maxProduct([0, 2]) != 2 { fatalError("d") }
if sol.maxProduct([-2]) != -2 { fatalError("e") }
if sol.maxProduct([2, -5, -2, -4, 3]) != 24 { fatalError("f") }
print("All tests passed!")
