// Problem: 167. Two Sum II - Input Array Is Sorted
// Difficulty: Medium
// URL: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//
// 【解法演進】HashMap O(n)/O(n) → 雙指標 O(n)/O(1)（最佳）
// 【最佳解核心思路】利用排序單調性，總和過小移左、過大移右。
// 【複雜度】時間：O(n)  空間：O(1)

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        // TODO: implement
        return []
    }

    func twoSum_brute(_ numbers: [Int], _ target: Int) -> [Int] {
        // TODO: implement
        return []
    }
}

func checkArr(_ actual: [Int], _ expected: [Int], _ name: String) {
    if actual == expected { print("✓ \(name)") }
    else { print("✗ \(name): expected \(expected) but got \(actual)") }
}

// MARK: - Tests
// let s = Solution()

// Test 1
// let result = s.solve(...)

print("All tests passed!")
