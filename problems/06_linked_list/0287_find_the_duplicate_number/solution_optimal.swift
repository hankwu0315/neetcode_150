// Problem: 0287. Find the Duplicate Number
// Difficulty: Medium

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0, fast = 0
        while true {
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast { break }
        }
        slow = 0
        while slow != fast { slow = nums[slow]; fast = nums[fast] }
        return slow
    }
}

func checkInt(_ a: Int, _ e: Int, _ msg: String) {
    if a != e { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

let sol = Solution()
checkInt(sol.findDuplicate([1, 3, 4, 2, 2]), 2, "ex1")
checkInt(sol.findDuplicate([3, 1, 3, 4, 2]), 3, "ex2")
checkInt(sol.findDuplicate([1, 1]), 1, "two")
checkInt(sol.findDuplicate([2, 2, 2, 2, 2]), 2, "all same")
checkInt(sol.findDuplicate([1, 4, 4, 2, 4]), 4, "multi")
print("All tests passed!")
