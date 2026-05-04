// Problem: 0704. Binary Search
// Difficulty: Easy

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target { return mid }
            if nums[mid] < target { l = mid + 1 } else { r = mid - 1 }
        }
        return -1
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.search([-1, 0, 3, 5, 9, 12], 9), 4, "ex1")
checkInt(sol.search([-1, 0, 3, 5, 9, 12], 2), -1, "ex2")
checkInt(sol.search([5], 5), 0, "single hit")
checkInt(sol.search([5], 3), -1, "single miss")
checkInt(sol.search([1, 2, 3, 4, 5], 1), 0, "first")
checkInt(sol.search([1, 2, 3, 4, 5], 5), 4, "last")
print("All tests passed!")
