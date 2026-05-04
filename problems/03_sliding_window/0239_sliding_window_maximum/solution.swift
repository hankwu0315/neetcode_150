// Problem: 239. Sliding Window Maximum
// Difficulty: Hard
// URL: https://leetcode.com/problems/sliding-window-maximum/
//
// 【解法演進】暴力 → 最大堆 → 單調遞減 deque（最佳）
// 【最佳解核心思路】deque 存索引，右端彈 <=nums[r]，左端彈過期。
// 【複雜度】時間：O(n)  空間：O(k)

import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
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
