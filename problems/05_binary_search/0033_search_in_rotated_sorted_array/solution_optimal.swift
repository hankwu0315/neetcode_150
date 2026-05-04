// Problem: 0033. Search in Rotated Sorted Array
// Difficulty: Medium

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target { return mid }
            if nums[l] <= nums[mid] {
                if nums[l] <= target && target < nums[mid] { r = mid - 1 } else { l = mid + 1 }
            } else {
                if nums[mid] < target && target <= nums[r] { l = mid + 1 } else { r = mid - 1 }
            }
        }
        return -1
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.search([4, 5, 6, 7, 0, 1, 2], 0), 4, "ex1")
checkInt(sol.search([4, 5, 6, 7, 0, 1, 2], 3), -1, "ex2")
checkInt(sol.search([1], 0), -1, "single miss")
checkInt(sol.search([1], 1), 0, "single hit")
checkInt(sol.search([1, 2, 3, 4, 5], 3), 2, "unrotated")
checkInt(sol.search([4, 5, 6, 7, 0, 1, 2], 4), 0, "left end")
checkInt(sol.search([4, 5, 6, 7, 0, 1, 2], 2), 6, "right end")
checkInt(sol.search([3, 1], 1), 1, "two")
print("All tests passed!")
