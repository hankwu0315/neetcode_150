// Problem: 0153. Find Minimum in Rotated Sorted Array
// Difficulty: Medium

import Foundation

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] > nums[r] { l = mid + 1 } else { r = mid }
        }
        return nums[l]
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.findMin([3, 4, 5, 1, 2]), 1, "ex1")
checkInt(sol.findMin([4, 5, 6, 7, 0, 1, 2]), 0, "ex2")
checkInt(sol.findMin([11, 13, 15, 17]), 11, "sorted")
checkInt(sol.findMin([2, 1]), 1, "two")
checkInt(sol.findMin([1]), 1, "single")
checkInt(sol.findMin([1, 2]), 1, "asc2")
checkInt(sol.findMin([2, 3, 4, 5, 1]), 1, "last min")
print("All tests passed!")
