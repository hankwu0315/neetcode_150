// 0268. Missing Number
import Foundation
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var x = nums.count
        for i in 0..<nums.count { x ^= i ^ nums[i] }
        return x
    }
}
let sol = Solution()
if sol.missingNumber([3, 0, 1]) != 2 { fatalError("a") }
if sol.missingNumber([0, 1]) != 2 { fatalError("b") }
if sol.missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]) != 8 { fatalError("c") }
if sol.missingNumber([0]) != 1 { fatalError("d") }
if sol.missingNumber([1]) != 0 { fatalError("e") }
print("All tests passed!")
