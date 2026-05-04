// Problem: 15. 3Sum
// Difficulty: Medium
// URL: https://leetcode.com/problems/3sum/
//
// 【解法演進】暴力 O(n³) → 排序 + 固定 + 雙指標 O(n²)（最佳）
// 【最佳解核心思路】排序後固定 i，雙指標找 sum = -nums[i]，跳過重複。
// 【複雜度】時間：O(n²)  空間：O(1)

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // TODO: implement
        return []
    }
}

func normTriplets(_ g: [[Int]]) -> [[Int]] {
    // TODO: implement
    return []
}

func checkTriplets(_ actual: [[Int]], _ expected: [[Int]], _ name: String) {
    if normTriplets(actual) == normTriplets(expected) { print("✓ \(name)") }
    else { print("✗ \(name): expected \(normTriplets(expected)) but got \(normTriplets(actual))") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
