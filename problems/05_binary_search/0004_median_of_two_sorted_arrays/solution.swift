// Problem: 0004. Median of Two Sorted Arrays
// Difficulty: Hard

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // TODO: implement
        return 0
    }
}

func checkDouble(_ a: Double, _ e: Double, _ msg: String) {
    if abs(a - e) > 1e-9 { fatalError("FAIL \(msg): \(a) vs \(e)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
